from django.shortcuts import render, redirect
from .models import Busstop, SoldCostMean, Detail, Hospital, Infra, Mart, Park, School, Subway, PlaceCode, Competition
from django.http import HttpResponse, HttpResponseRedirect
import json
from django.db import connection
import folium
seven_sido_list = ['서울', '부산', '대구', '인천', '광주', '대전', '울산', '세종']


# 등급 구간별 분기별 매매가 평균 데이터를 ajax로 응답
def getSoldMean(sido):
    #[{name: '1~3', data: [얼마, 얼마, 얼마, 얼마]}, {name: 'n단위', data: [얼마, 얼마, 얼마, 얼마]},
    # {name: 'n단위', data: [얼마, 얼마, 얼마, 얼마]}]
    cursor = connection.cursor()

    ranks = [[1,2,3], [4,5,6], [7,8,9], [10,11,12], [13,14,15], [16,17,18], [19,20,21]]
    quarters = [['01','02','03'], ['04','05','06'], ['07','08','09'], ['10','11','12']]
    years = [20, 21, 22]

    result = list()
    for rank in ranks:
        ran = f'{rank[0]}~{rank[2]}'
        maen_dict = dict()
        mean_list = list()
        for year in years:
            for quarter in quarters:
                strSql = f"""SELECT avg(mean_cost)
                            FROM sold_cost_mean join place_code on (sold_cost_mean.place_code = place_code.place_code)
                            WHERE (area_grade like '{rank[0]}__' or area_grade like '{rank[1]}__' or area_grade like '{rank[2]}__' )
                            and (month like '__{year}{quarter[0]}' or month like '__{year}{quarter[1]}' or month like '__{year}{quarter[2]}')
                            and place like '{sido}%'"""
                success = cursor.execute(strSql)
                sold_mean = cursor.fetchall()
                mean = sold_mean[0][0]
                if mean == None:
                    mean_list.append(0)
                else:
                    mean_list.append(round(mean, 2))
        maen_dict['name'] = ran
        maen_dict['data'] = mean_list
        result.append(maen_dict)

    connection.commit()
    connection.close()

    return result


# 등급 구간별 분기별 매매가 평균 데이터를 ajax로 응답
def getSoldMean2(sido):
    #[{name: '1~3', data: [얼마, 얼마, 얼마, 얼마]}, {name: 'n단위', data: [얼마, 얼마, 얼마, 얼마]},
    # {name: 'n단위', data: [얼마, 얼마, 얼마, 얼마]}]
    cursor = connection.cursor()

    ranks = [[1,2,3], [4,5,6], [7,8,9], [10,11,12], [13,14,15], [16,17,18], [19,20,21]]
    quarters = [['01','02','03'], ['04','05','06'], ['07','08','09'], ['10','11','12']]
    years = [20, 21, 22]

    result = list()
    for rank in ranks:
        ran = f'{rank[0]}~{rank[2]}'
        mean_dict = dict()
        mean_list = list()
        strSql = f"""SELECT substr(month, 3, 4), avg(mean_cost)
                    FROM sold_cost_mean join place_code on (sold_cost_mean.place_code = place_code.place_code)
                    WHERE (area_grade like '{rank[0]}__' or area_grade like '{rank[1]}__' or area_grade like '{rank[2]}__' )
                    and place like '{sido}%'
                    group by substr(month, 3, 4)"""
        success = cursor.execute(strSql)
        sold_mean = cursor.fetchall()
        sold_mean = dict(sold_mean)
        for year in years:
            for quarter in quarters:
                mean = 0
                for mon in quarter:
                    qumon = str(year)+mon
                    try:
                        mean = mean + float(sold_mean[qumon])
                    except:
                        pass
                qumon0 = str(year) + quarter[0]
                qumon1 = str(year) + quarter[1]
                qumon2 = str(year) + quarter[2]
                if qumon0 in sold_mean and qumon1 in sold_mean and qumon2 in sold_mean:
                    mean = mean/3
                elif qumon0 in sold_mean and qumon1 in sold_mean :
                    mean = mean/2
                    # print(qumon0, qumon1)

                if mean == None:
                    mean_list.append(0)
                else:
                    mean_list.append(round(mean, 2))

        mean_dict['name'] = ran
        mean_dict['data'] = mean_list
        result.append(mean_dict)

    connection.commit()
    connection.close()

    # print(result)
    return result


# sido 별 각 infra 갯수, In : 시도이름, 
# Out : dict {"school":0, "subway":0, "mart":0, "park":0, "hospital":0, 'busstop':0, 'convinient': 0}
def find_infra_count(sido):  
    detail_list = load_detail_sido(sido)
    house_manage_list = []
    infra_list = []
    infra_count = {"school": 0, "subway": 0, "mart": 0, "park": 0, "hospital": 0, 'busstop': 0, 'convinient': 0}
    for i in detail_list:
        house_manage_list.append(i["house_manage_no"])

    infra = Infra.objects.all().values()
    for i in infra:
        if i['house_manage_no'] in house_manage_list:
            infra_count['school'] += len(i['school'])
            infra_count['subway'] += len(i['subway'])
            infra_count['mart'] += len(i['mart'])
            infra_count['park'] += len(i['park'])
            infra_count['hospital'] += len(i['hospital'])
            infra_count['busstop'] += len(i['busstop'])
            infra_count['convinient'] += len(i['convinient'])

    return infra_count


def getInfraSido(sido):
    # sido 입력받으면 그 sido에
    # {name: 'park', gu_list:[1구, 2구, 3구], data:[1구 name개수, 2구 name개수, 3구 name개수]}
    infra_list = ['school', 'subway', 'park', 'hospital', 'convinient']
    cursor = connection.cursor()
    result = list()

    # 이름 중복되지 않도록 namelist만듬
    name_dict = dict()
    for infra in infra_list:
        strSql = f"""select place from {infra} where place like '{sido}%';"""
        success = cursor.execute(strSql)
        convinient_list = list(cursor.fetchall())
        # gu를 키로 갖는 gu_dict 초기화
        for convinient in convinient_list:
            convinient = list(convinient)

            gu = convinient[0].split()[1]
            gu_find = gu.find('구')
            gun_find = gu.find('군')
            si_find = gu.find('시')
            if gu_find > 0:
                if gu[:gu_find+1] != '도붕구':
                    name_dict[gu[:gu_find+1]] = 0
            elif gun_find > 0:
                name_dict[gu[:gun_find+1]] = 0
            elif si_find > 0:
                if gu[:si_find + 1] != '구노시':
                    name_dict[gu[:si_find + 1]] = 0

    name_list = list(name_dict.keys())

    # name_list에 따라 각각의 infra 카운트
    for infra in infra_list:
        strSql = f"""select place from {infra} where place like '{sido}%';"""
        success = cursor.execute(strSql)
        convinient_list = list(cursor.fetchall())

        gu_dict = dict()
        for name in name_list:
            gu_dict[name] = 0

        # 각각의 gu cnt
        for convinient in convinient_list:
            convinient = list(convinient)
            gu = convinient[0].split()[1]
            gu_find = gu.find('구')
            gun_find = gu.find('군')
            si_find = gu.find('시')
            if gu_find > 0:
                if gu[:gu_find + 1] != '도붕구':
                    gu_dict[gu[:gu_find+1]] = gu_dict[gu[:gu_find+1]] + 1
            elif gun_find > 0:
                gu_dict[gu[:gun_find+1]] = gu_dict[gu[:gun_find+1]] + 1
            elif si_find > 0:
                if gu[:si_find + 1] != '구노시':
                    gu_dict[gu[:si_find + 1]] = gu_dict[gu[:si_find + 1]] + 1


        gu_dict2 = dict()
        gu_dict2['name'] = infra
        gu_dict2['gu_list'] = list(gu_dict.keys())
        gu_dict2['data'] = list(gu_dict.values())
        result.append(gu_dict2)

    connection.commit()
    connection.close()
    return result


def getSupplySize(sido):
    # sido 입력받으면 그 sido에
    # {gu_list:[1구, 2구, 3구], data:[1구 name개수, 2구 name개수, 3구 name개수]}
    cursor = connection.cursor()
    result = list()

    name_dict = dict()
    # 이름 중복되지 않도록 namelist만듬
    strSql = f"""select address, supply_size from detail
                where address like '{sido}%';"""
    success = cursor.execute(strSql)
    supply_names = list(cursor.fetchall())

    # gu를 키로 갖는 gu_dict 초기화
    for name in supply_names:
        name = list(name)
        gu = name[0].split()[1]
        gu_find = gu.find('구')
        gun_find = gu.find('군')
        si_find = gu.find('시')
        if gu_find > 0:
            name_dict[gu[:gu_find + 1]] = 0
        elif gun_find > 0:
            name_dict[gu[:gun_find + 1]] = 0
        elif si_find > 0:
            name_dict[gu[:si_find + 1]] = 0

    name_list = list(name_dict.keys())

    gu_dict = dict()
    for name in name_list:
        gu_dict[name] = 0

    # 각각의 gu의 supply_sum
    for supply in supply_names:
        supply = list(supply)
        gu = supply[0].split()[1]
        gu_find = gu.find('구')
        gun_find = gu.find('군')
        si_find = gu.find('시')
        if gu_find > 0:
            gu_dict[gu[:gu_find + 1]] = gu_dict[gu[:gu_find + 1]] + supply[1]
        elif gun_find > 0:
            gu_dict[gu[:gun_find + 1]] = gu_dict[gu[:gun_find + 1]] + supply[1]
        elif si_find > 0:
            gu_dict[gu[:si_find + 1]] = gu_dict[gu[:si_find + 1]] + supply[1]

    gu_dict2 = dict()
    gu_dict2['gu_list'] = list(gu_dict.keys())
    gu_dict2['data'] = list(gu_dict.values())
    result.append(gu_dict2)

    connection.commit()
    connection.close()
    return result


def getQuarterSupply(sido):
    #[{name: '1~3', data: [얼마, 얼마, 얼마, 얼마]}, {name: 'n단위', data: [얼마, 얼마, 얼마, 얼마]},
    # {name: 'n단위', data: [얼마, 얼마, 얼마, 얼마]}]
    cursor = connection.cursor()

    quarters = [['01','02','03'], ['04','05','06'], ['07','08','09'], ['10','11','12']]
    years = [20, 21, 22]

    result = list()
    sum_dict = dict()
    sum_list = list()
    for year in years:
        for quarter in quarters:
            strSql = f"""SELECT sum(supply_size)
                        FROM detail
                        WHERE (START_RECEIPT like '__{year}-{quarter[0]}%' or START_RECEIPT like '__{year}-{quarter[1]}%' 
                                or START_RECEIPT like '__{year}-{quarter[2]}%')
                        and ADDRESS like '{sido}%'"""
            success = cursor.execute(strSql)
            supply_size_sum = cursor.fetchall()
            sum = supply_size_sum[0][0]
            # print(sum)
            if sum == None:
                sum_list.append(0)
            else:
                sum_list.append(int(sum))
    sum_dict['name'] = sido
    sum_dict['data'] = sum_list
    result.append(sum_dict)

    connection.commit()
    connection.close()

    return result


def getRateSido(sido):
    # "CMPET_RATE": "lacked"
    # 전체 데이터 개수를 구하고
    # "lacked"개수를 구하고
    # 경쟁률 있는 매물 개수 = (1) - (2)
    # {'total': int, 'lack': int, 'non_lack': int}
    cursor = connection.cursor()

    strSql = f"""select count(*)
                from competition join detail on (competition.house_manage_no = detail.house_manage_no)
                where address like '{sido}%'
                and compet_rate = 'lacked'"""
    success = cursor.execute(strSql)
    rate_lacked = cursor.fetchall()

    strSql = f"""select count(*)
                from competition join detail on (competition.house_manage_no = detail.house_manage_no)
                where address like '{sido}%'"""
    success = cursor.execute(strSql)
    rate_all = cursor.fetchall()

    connection.commit()
    connection.close()

    result = dict()
    total = int(rate_all[0][0])
    result['lacked'] = int(rate_lacked[0][0])
    result['non_lacked'] = total - result['lacked']

    return result


def rankCompet(sido, max_count=5):
    cursor = connection.cursor()

    strSql = f"""select house_name, compet_rate
                from competition join detail on (competition.house_manage_no = detail.house_manage_no)
                where address like '{sido}%' and compet_rate != 'lacked'"""
    success = cursor.execute(strSql)
    rank_all = list(cursor.fetchall())

    rank_list = list()
    for rank in rank_all:
        rank_list.append(list(rank))

    for rank in rank_list:
        rank[1] = float(rank[1])

    rank_list.sort(key=lambda x: -x[1])

    result = list()
    for i in range(max_count):
        re_dict = dict()
        re_dict['rank'] = i + 1
        re_dict['name'] = rank_list[i][0]
        re_dict['compet'] = rank_list[i][1]
        result.append(re_dict)

    return result