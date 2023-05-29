# Crawling

conda create -n  [mycrawling] python==3.9

pip install beautifulsoup4

beautifulsoup
HTML과 XML 파일의 데이타를 가지고오는 python library
parser		=> 		DOM  HTTPResponse 객체로 가지고온 doc을 객체로 바꾸다

parser /parse tree		=> 찾아볼것

```
from bs4 import BeautifulSoup
```

crawling - 해당 내용 다 가지고옴

scrapping - crawling한것중 필요한 내용 가지고 오기



```
import urllib.request
```

내장 모듈 urllib에서 request 사용

클라 ===> server



```
resp = urllib.request.urlopen('https://movie.naver.com/movie/running/current.naver')
```

url을 요청해서
<http.client.HTTPResponse object at 0x0000020DC1A4EE50> 이를 응답해줌
이는 HTTPResponse 객체인데 이 객체에는 doc(html)이 있다



```
soup = BeautifulSoup(resp, 'html.parser')
```

BeautifulSoup은 HTTPResponse object를 parser tree(Node LIst/tree)로 만들어줌
DOM 해줌



상위 tag를 먼저 가지고오고 그 뒤 필요한 태그의 내용을 가지고온다.



```
movies = soup.find_all('dl', class_='lst_dsc')
```

dl 태그에 class가 lst_dsc인 내용들





요청 urls => 응답받은건 doc( str ) => 이걸 obj로

​				<==                 parser                  ==>           이과정을 parsing/parser



find()

- 가지고 오려는 tag의 개수를 정할 수 있다



get_text()

- tag안에 text를 가지고 온다.



pip install requests
이게 좀더 편함		urllib.request.urlopen이랑 기능은 같음



```
# -*- coding:utf-8 -*-
# 해당 파일은 utf-8로 인코딩 됩니다
```



**json**

{'key' : [value]}





크롤링 설정

/robots.txt				해당 사이트의 허용여부

User-agent: *
Disallow: /		/부터 다금지
Allow : /$ 			





open api

- Application Program Interface
- 컴퓨터나 컴퓨터 프로그램 사이의 연결
- 원하는 형태로 요청하면 가지고 있는 데이터를 응답해줌
- xml, json, xlsx, csv, tsv 등등 여러 형태로 받을수 있음



https://www.data.go.kr/tcs/dss/selectDataSetList.do?dType=FILE&keyword=%EA%B5%90%EC%9C%A1&currentPage=5

기존 url에서 이렇게 바꿔도 제대로 요청된다

* get 방식이라 이렇게보임



**strip()**  => 공백 제거



nums = list(filter(None, map(lambda x: x.text if x.text.isdigit() else None, paging)))





공공 api

**End Point** => url	서비스 전체 관리

서비스url은 상세 보기에서

get방식으로 ?ServiceKey= 해서 키값 넣기



보통 api는 xml, json, 파일일 경우 csv 파일인 경우가 많아 이 3개 parsing을 잘 해봐야 한다



```
<item>
    <createDt>2022-02-09 10:38:16.257</createDt>
    <deathCnt>6943</deathCnt>
    <defCnt>1131239</defCnt>
    <gubun>합계</gubun>				   title
    <gubunCn>合计</gubunCn>
    <gubunEn>Total</gubunEn>
    <incDec>49567</incDec>				오늘 총 확진
    <isolClearCnt>719627</isolClearCnt>
    <localOccCnt>49402</localOccCnt>	국내 확진
    <overFlowCnt>165</overFlowCnt>		해외 확진
    <qurRate>2191</qurRate>
    <seq>15001</seq>
    <stdDay>2022년 02월 09일 00시</stdDay>
    <updateDt>null</updateDt>
</item>
```



## example

- Open API활용 해서 크롤링
- 스타벅스 크롤링
- 스타벅스 크롤링과 Django(장고) Ajax로 활용
- 드라이버(driver) 이용,셀레니움 사용
- Naver크롤링
- 인스타 크롤링,및 인스타 img태그 로 사진다운
- 그외 seaborn과 matplot같은 시각화 패키지 사용
- 기본 folium연습 (추후 프로젝트에서 더 많이 활용하게됨)
- wordcloud연습
- 크롤링을 이용해 Json파일 만들기
