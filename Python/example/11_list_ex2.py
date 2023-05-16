# enter키 입력 받을 때 까지 점수를 입력받아서 리스트로 생성하고 총점과 평균을 계산하여 출력
# 80점 이상의 학생도 출력
scores = []
total = 0
cnt80 = 0
i = 0
while True:
    i += 1
    score = input('학생{} 점수입력 : '.format(i))
    if score == '':
        break
    elif 0 <= int(score) <= 100:
        scores.append(int(score))
    else:
        scores.append(0)
        continue

print(scores)
for score in scores:
    if score >= 80:
        cnt80 += 1
    total += score
print('총합은 {}이고, 평균은{:.2f}'.format(total, total/i))
print('80점 이상 학생 {}'.format(cnt80))