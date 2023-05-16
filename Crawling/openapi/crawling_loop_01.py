from bs4 import BeautifulSoup
import requests

urls = 'https://www.data.go.kr/tcs/dss/selectDataSetList.do?dType=FILE&keyword=%EA%B5%90%EC%9C%A1&currentPage='

# doc, dom
resp = requests.get(urls + '1')
print(resp)
soup = BeautifulSoup(resp.text, 'html.parser')
# titles = soup.find_all('span', class_='title')
# print(titles
# for title in titles:
#     print(title.text.strip())

paginations = soup.find('nav', class_='pagination')

pagenum = []
for pagination in paginations:
    # print(pagination.text)
    if pagination.text.isdigit():
        pagenum.append(pagination.text)

# nums = list(filter(None, map(lambda x: x.text if x.text.isdigit() else None, paging)))

print(pagenum)

for i in pagenum:
    resp1 = requests.get(urls + i)
    soup1 = BeautifulSoup(resp1.text, 'html.parser')
    # soup1 = BeautifulSoup(requests.get(url+i).text, 'html.parser')

    titles1 = soup1.find_all('span', class_='title')
    # titles = soup.select('span[class=title]')
    for titlesp in titles1:
        title = titlesp.text.strip()
        print(title)