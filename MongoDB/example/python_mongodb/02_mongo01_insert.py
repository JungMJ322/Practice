from pymongo import MongoClient

'''
score collection에
name: '한지민', kor: 100, eng: 30, math: 50
name: '송강', kor: 50, eng: 100, math: 70
입력하자
'''


client = MongoClient('localhost', 27017)
db = client.test

score = db.score
'''
result01 = score.insert_many(
    [
        {'name': '한지민', 'kor': 100, 'eng': 30, 'math': 50},
        {'name': '송강', 'kor': 50, 'eng': 100, 'math': 70}
    ]
)

print(result01)
print(result01.inserted_ids)
'''

result02 = score.insert_one(
    {'name': '신민아', 'kor': 50, 'eng': 70, 'math': 100}
)

print(result02)
print(result02.inserted_id)