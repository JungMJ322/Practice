import requests


# 사용 API
service_key = 'c2fe7e00bf564e966df521e1c239deca'
add = '구로소방서 앞 사거리'
url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(add)
header = {'Authorization': 'KakaoAK ' + service_key}

resp = requests.get(url, headers=header)
loc = resp.json()['documents']
print(loc)