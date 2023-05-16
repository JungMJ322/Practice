# -*- coding:utf-8 -*-

import requests
import json

def getSiDo():
    # __ajaxCall("/store/getSidoList.do", {}, true, "json", "post",
    url = "https://www.starbucks.co.kr/store/getSidoList.do"
    resp = requests.post(url)
    # print(resp)
    # print(resp.json())
    # print(resp.json()['list'][1]['sido_cd'])

    cdnmList = []
    sido_cd_list = []
    sido_nm_list = []
    for re in resp.json()['list']:
        sido_cd = re['sido_cd']
        sido_nm = re['sido_nm']

        sido_cd_list.append(sido_cd)
        sido_nm_list.append(sido_nm)

        # dic = {}
        # dic['sido_cd'] = sido_cd
        # dic['sido_nm'] = sido_nm
        # cdnmList.append(dic)

    # sido_code = list(map(lambda x: x['sido_cd_list'], resp.json()['list']))
    # sido_nm = list(map(lambda x: x['sido_nm_list'], resp.json()['list']))
    # print(cdnmList)
    # print(sido_cd_list)
    # print(sido_nm_list)
    sido_dict = dict(zip(sido_cd_list, sido_nm_list))
    # print(sido_dict)
    return sido_dict

def getGuGun(sido_code):
    # {gugun_code: gugun_n,. ...}
    # __ajaxCall("/store/getGugunList.do", {"sido_cd":sido}, true, "json", "post",
    url = "https://www.starbucks.co.kr/store/getGugunList.do"
    resp = requests.post(url, data={'sido_cd': sido_code})      # 데이타 요청하는법 url, data={}
    # print(resp.json())

    gugun_list = resp.json()['list']
    gugun_dict = dict(zip(list(map(lambda x: x['gugun_cd'], gugun_list)),
                          list(map(lambda x: x['gugun_nm'], gugun_list))))
    # print(gugun_dict)
    return gugun_dict

def getStore(sido_code='', gugun_code=''):
    # var storeInterfaceUrl = "/store/getStore.do?r=" + rndCod;
    # __ajaxCall(storeInterfaceUrl,$search, true, "json", "post",
    url = 'https://www.starbucks.co.kr/store/getStore.do'
    resp = requests.post(url, data={'ins_lat': '37.56682',
                                    'ins_lng': '126.97865',
                                    'p_sido_cd': sido_code,
                                    'p_gugun_cd': gugun_code,
                                    'in_biz_cd': '',
                                    'set_date': ''})
    # print(resp.json())
    store_list = resp.json()['list']
    # 's_name', 'tel', 'doro_address', 'lat', 'lot'(lat, lot은 지도 표시할때?)
    stores = []
    for list in store_list:
        list_dict = dict()
        list_dict['s_name']         = list['s_name']
        list_dict['tel']            = list['tel']
        list_dict['doro_address']   = list['doro_address']
        list_dict['lat']            = list['lat']
        list_dict['lot']            = list['lot']
        stores.append(list_dict)
    # print(stores)
    # {'store_list': [{},{},{}, ...]}
    stores_dict = dict()
    stores_dict['store_list'] = stores
    # print(stores_dict)
    # json저장
    stores_json = json.dumps(stores_dict, ensure_ascii=False)

    # 서울시 가평군 starbuck.json 과같은 형태의 이름으로 저장해보기
    with open('starbucks01.json', 'w', encoding='utf_8') as f:
        f.write(stores_json)
    return stores_json




if __name__ == '__main__':
    print(getSiDo())
    sido = input('도시 코드를 입력해 주세요 : ')
    if sido == '17':
        getStore(sido_code='17', gugun_code='')
    else:
        print(getGuGun(sido))
        gugun = input('구군 코드를 입력해 주세요 : ')
        print(getStore(gugun_code=gugun))

