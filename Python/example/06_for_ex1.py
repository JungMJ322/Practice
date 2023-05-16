# 문제 : 1부터 10까지 더한 후 더한 결과 출력
sumN = 0

for i in range(11):         # 1부터 10까지 반복
    sumN += i

print('1부터 10까지 더한 값 = {}'.format(sumN))

# # 1~100까지의 홀수, 짝수 더한 결과 출력
sumN = 0
sumN2 = 0

for i in range(1, 101):     # 1부터 100까지 반복
    if i % 2 == 1:
        sumN += i
    else:
        sumN2 += i

print('1부터 100까지 홀수를 더한 값 = {}'.format(sumN))
print('1부터 100까지 짝수를 더한 값 = {}'.format(sumN2))

# 1~100 사이의 3의 배수 출력하고 더하기
sumN = 0

for i in range(1, 101):     # 1부터 100까지 반복
    if i % 3 == 0:
        sumN += i
        print(i, end=" ")
print("")
print('더한 값 = {}'.format(sumN))
