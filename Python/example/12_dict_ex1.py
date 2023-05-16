# 1. 각 학생의 성적에 대한 총점과 편균을 구하시오
students = [
   {"name": "홍길동", "korean": 87, "math": 98, "english": 88, "science": 95},
   {"name": "이몽룡", "korean": 92, "math": 98, "english": 96, "science": 98},
   {"name": "성춘향", "korean": 76, "math": 96, "english": 94, "science": 90},
   {"name": "변학도", "korean": 98, "math": 92, "english": 96, "science": 92},
   {"name": "박지성", "korean": 95, "math": 98, "english": 98, "science": 98},
   {"name": "류현진", "korean": 64, "math": 88, "english": 92, "science": 92}
]

subj = ['korean', 'math', 'english', 'science']

print('이름\t\t총점\t\t평균\t\t')
for i in students:
    sum1 = 0
    for j in subj:
        sum1 += i[j]
    avg = sum1 / 4
    print('{}\t\t{}\t\t{}'.format(i['name'], sum1, avg))
