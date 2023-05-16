from selenium import webdriver
from bs4 import BeautifulSoup

tag = input('search tags: ')
url = f'https://www.instagram.com/explore/tags/{tag}'

service = webdriver.chrome.service.Service('../drivers/chromedriver.exe')
driver = webdriver.Chrome(service=service)

driver.implicitly_wait(3)       # 3초 기다렸다가 url 가지고 와줘라
driver.get(url)
                # 지금 page_source를 가지고와라
soup = BeautifulSoup(driver.page_source, 'html.parser')
img_list = soup.find_all('div', class_='KL4Bh')

# div tag라서 div 안에있는 img를 src만 뽑아 보기(img만 뽑아보기)
for img in img_list:
    print(img)