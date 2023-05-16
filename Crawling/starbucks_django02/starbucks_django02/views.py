from django.shortcuts import render, HttpResponse
from django.http import JsonResponse
# from . import models
import base64
import requests
import matplotlib.pyplot as plt
import json


def index(request):
    return render(request, 'index.html')

def getSiDo(request):
    # __ajaxCall("/store/getSidoList.do", {}, true, "json", "post",
    url = "https://www.starbucks.co.kr/store/getSidoList.do"
    resp = requests.post(url)

    cdnmList = []
    sido_cd_list = []
    sido_nm_list = []
    for re in resp.json()['list']:
        sido_cd = re['sido_cd']
        sido_nm = re['sido_nm']

        sido_cd_list.append(sido_cd)
        sido_nm_list.append(sido_nm)

    # sido_code = list(map(lambda x: x['sido_cd_list'], resp.json()['list']))
    # sido_nm = list(map(lambda x: x['sido_nm_list'], resp.json()['list']))

    sido_dict = dict(zip(sido_cd_list, sido_nm_list))

    return JsonResponse(sido_dict)

def getGuGun(request):
    sido_code = request.GET['sido_code']
    url = "https://www.starbucks.co.kr/store/getGugunList.do"
    resp = requests.post(url, data={'sido_cd': sido_code})

    gugun_list = resp.json()['list']
    gugun_dict = dict(zip(list(map(lambda x: x['gugun_cd'], gugun_list)),
                          list(map(lambda x: x['gugun_nm'], gugun_list))))
    # print(gz
    return JsonResponse(gugun_dict)

def getStore(request):
    # var storeInterfaceUrl = "/store/getStore.do?r=" + rndCod;
    # __ajaxCall(storeInterfaceUrl,$search, true, "json", "post",

    code = request.GET['code']
    sido_code = code if code == '17' else ''
    gugun_code = '' if code == '17' else code

    url = 'https://www.starbucks.co.kr/store/getStore.do'
    resp = requests.post(url, data={'ins_lat': '37.56682',
                                    'ins_lng': '126.97865',
                                    'p_sido_cd': sido_code,
                                    'p_gugun_cd': gugun_code,
                                    'in_biz_cd': '',
                                    'set_date': ''})

    store_list = resp.json()['list']

    stores = []
    for list in store_list:
        list_dict = dict()
        list_dict['s_name']         = list['s_name']
        list_dict['tel']            = list['tel']
        list_dict['doro_address']   = list['doro_address']
        list_dict['lat']            = list['lat']
        list_dict['lot']            = list['lot']
        stores.append(list_dict)

    stores_dict = dict()
    stores_dict['store_list'] = stores

    return JsonResponse(stores_dict)

def getImg(request):
    with open('gangnam_casualties.json', 'r', encoding='utf_8') as f:
        gangnam = json.load(f)

    gugun = gangnam['강남']
    yearList = ['2015', '2016', '2017', '2018', '2019']
    accident = list()

    # 선택한 구의 연도별 사고 현황을 accident라는 list에 저장
    for year in yearList:
        accident.append(gugun['강남구'][year])
    print(accident)

    f = plt.figure()
    plt.plot(yearList, accident)    # x축이 각각의 연도, y축이 사고 발생 수
    plt.yticks(list(range(0, 101, 10)))   # y축 범위를 0부터 100까지 10의 단위로
    plt.ylim(0, 100, 10)                 # y축이 0부터 50까지
    # plt.show()

    
    plt.savefig('/media/plotG.png')

    
    return HttpResponse(0)
