# -*- coding:utf-8 -*-

import json
import requests
import pyproj

def doro_search(add):
    service_key = 'devU01TX0FVVEgyMDIyMDIxNDE3MDkwMTExMjI0NDI='
    url = f'https://www.juso.go.kr/addrlink/addrLinkApi.do?confmKey={service_key}&resultType=json&countPerPage=1&'
    # add = '한적 2길 51-14'
    search = f'keyword={add}'

    resp = requests.get(url + search)

    # resp == {'results': {'juso': [{'admCd': val, ...}]}
    juso = resp.json()['results']['juso'][0]
    # print(juso)

    juso_list = []
    juso_list.append(juso['admCd'])
    juso_list.append(juso['rnMgtSn'])
    juso_list.append(juso['buldMnnm'])
    juso_list.append(juso['buldSlno'])
    # admCd : 행정구역코드, rnMgSn : 도로명코드, buldMnnm : 건물본번, buldSlno : 건물부번

    # print(juso_list)
    return juso_list

def location_search(admCd, rnMgtSn, buldMnnm, buldSlno='0'):
    service_key = 'devU01TX0FVVEgyMDIyMDIxNDE4MTMwMTExMjI0NDM='
    url = f'https://www.juso.go.kr/addrlink/addrCoordApi.do?confmKey={service_key}&resultType=json&udrtYn=0&'
    search = f"admCd={admCd}&rnMgtSn={rnMgtSn}&buldMnnm={buldMnnm}&buldSlno={buldSlno}"

    resp = requests.get(url + search)
    juso = resp.json()['results']['juso'][0]
    print(juso)
    x = juso['entX']        # UTM-K x좌표
    y = juso['entY']        # UTM-K y좌표
    print(x,y)

    UTMK =  'EPSG:5179'  # UTM-K 도로명주소 좌표
    WGS84 = 'EPSG:4326'  # Wgs84 경도/위도 GPS등 전세계적으로 사용

    transformer = pyproj.Transformer.from_crs(UTMK, WGS84)
    x2, y2 = transformer.transform(x, y)
    # x, y값을 UTMK 형식의 좌표를 WGS84의 좌표로 변경
    # x2, y2 = transformer.transform(954044.456801, 1952705.016923)

    return x2, y2

def nevi(x, y):
    WGS84 = 'EPSG:4326'
    inProj = pyproj.Proj('+proj=tmerc +lat_0=38 +lon_0=128 +k=0.9999 +x_0=400000 +y_0=600000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43')

    transformer = pyproj.Transformer.from_crs(inProj, WGS84)
    x2, y2 = transformer.transform(x, y)

if __name__ == '__main__':
    add = '한적 2길 51-14'
    doro = doro_search(add)
    print(location_search(doro[0], doro[1], doro[2], doro[3]))
