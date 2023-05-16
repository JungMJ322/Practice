from bs4 import BeautifulSoup
import requests

url = 'https://www.data.go.kr/tcs/dss/selectDataSetList.do?dType=FILE&keyword=%EA%B5%90%EC%9C%A1&currentPage=5'

# doc
resp = requests.get(url)

# dom
soup = BeautifulSoup(resp.text, 'html.parser')

spans = soup.find_all('span', {'class': 'title'})

spanList = []
for span in spans:
    title = span.text
    spanList.append(title.strip())

print(spanList)