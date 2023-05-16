from selenium import webdriver
from selenium.webdriver.common.by import By
from time import sleep

input_id = input('id 입력 : ')
input_pw = input('pw 입력 : ')

service = webdriver.chrome.service.Service('../drivers/chromedriver.exe')
driver = webdriver.Chrome(service=service)
driver.get('https://www.instagram.com/accounts/login/')
sleep(5)

# element면 제일 처음꺼 1개 elements면 전부
id = driver.find_element(By.NAME, 'username')
id.send_keys(input_id)

pw = driver.find_element(By.NAME, "password")
pw.send_keys(input_pw)
sleep(2)

driver.find_element(By.CSS_SELECTOR, '#loginForm > div > div:nth-child(3)').click()
sleep(3)

driver.find_element(By.CSS_SELECTOR, '.cmbtv').click()
sleep(3)

later = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div[3]/button[2]')
later.click()
