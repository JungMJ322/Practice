from bs4 import BeautifulSoup
import urllib.request

resp = urllib.request.urlopen('https://movie.naver.com/movie/running/current.naver')
# print(resp)

soup = BeautifulSoup(resp, 'html.parser')
# print(type(soup))       # class bs.beautifulSoup임으로 객체이다

movies = soup.find_all('dl', class_='lst_dsc')
# print(movies[0])

for movie in movies:
    # 제목
    # aTag = movie.find_all('a')
    # title = aTag[0].string
    title = movie.find('a').get_text()
    # 별점
    # spanTag = movie.find_all('span', class_='num')
    # star = spanTag[0].string
    star = movie.find('span', class_='num').text
    print(f'{title} [{star}]')

