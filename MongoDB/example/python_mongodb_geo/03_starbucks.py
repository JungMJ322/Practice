import json

from pymongo import MongoClient

"""
1. starbucks_all.json 읽기
2. 읽어온 파일 한 줄씩 json_data로 저장.
3. json_data를 dictinary로 변환(result_dict)
    result_dict에 'list'라는 키를 입력하여, 리턴된 value를 반복문으로 출력

"""

with open('starbucks_all.json', 'r', encoding='utf8') as f:
    json_data = json.load(f)

# print(json_data)
result_dict = dict(json_data)
# print(result_dict)
# for data in result_dict['list']:
#     print(data)

# 4. mongodb와 연결 (db: test / collection: starbucks01)
client = MongoClient('localhost', 27017)
db = client.test
starbucks01 = db.starbucks01

# 5. result_dict['list'] 값을 mongodb에 저장
res = starbucks01.insert_many(result_dict['list'])
# print(res)

# 6. starbucks01 collection 전체 출력
all = starbucks01.find({})
for data in all:
    print(data)

