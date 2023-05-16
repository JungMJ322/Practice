# -*- coding:utf-8 -*-
# 해당 파일은 utf-8로 인코딩 됩니다

from bs4 import BeautifulSoup
import requests

tag = input('search tags: ')
url = f'https://www.instagram.com/explore/tags/{tag}'

resp = requests.get(url)
soup = BeautifulSoup(resp.text, 'html.parser')
# print(soup)

# KL4Bh
print(soup.find('div', class_='KL4Bh'))