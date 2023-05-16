# -*- coding:utf-8 -*-
# 해당 파일은 utf-8로 인코딩 됩니다

from bs4 import BeautifulSoup
import requests
import json

url = 'https://comic.naver.com/webtoon/weekdayList?week=wed'

# doc
resp = requests.get(url)        # url에서 doc 가지고 오기
# print(resp)
# print(resp.text)

# obj
soup = BeautifulSoup(resp.text, 'html.parser')
# print(soup)


webtoonsUl = soup.find('ul', class_='img_list')     # ul tag에 class_가 img_list
webtoons = webtoonsUl.find_all('li')                # ul안에 li를 리스트로
# print(webtoons[0].find('a')['title'])

# webtoonDict = {}                                    # data 저장할 dict
webtoonList = []
for webtoon in webtoons:
    title = webtoon.find('a')['title']              # a tag의 title을 가지고옴
    star = webtoon.find('strong').get_text()        # strong tag의 text를 가지고옴
    # print(f'{title} [{star}]')
    # webtoonDict[title] = star                       # 제목이 키이고 별점이 값인 dict만들기
    tmp = dict()
    tmp['title'] = title
    tmp['star'] = star

    webtoonList.append(tmp)

print(webtoonList)
