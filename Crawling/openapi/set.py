import json
import requests


service_key = 'devU01TX0FVVEgyMDIyMDIxNDE3MDkwMTExMjI0NDI='
url = f'https://www.juso.go.kr/addrlink/addrLinkApi.do?confmKey={service_key}&resultType=json&countPerPage=1&'
add = '한적 2길 51-14'
search = f'keyword={add}'

resp = requests.get(url + search)
juso = resp.json()['results']['juso'][0]
# print(juso)

admCd       = juso['admCd']
rnMgtSn     = juso['rnMgtSn']
buldMnnm    = juso['buldMnnm']
buldSino    = juso['buldSlno']

print(admCd, rnMgtSn, buldMnnm, buldSino)