# 문제 :
# 정수를 입력받아서 홀수인지 짝수인지 판별하여 출력

# 정수 3을 입력
# 결과값 홀수

num = int(input('정수 입력 : '))

if (num%2 == 0):
    print('짝수')
elif (num%2 == 1):
    print('홀수')


# 다중 if / if ~ elif
if num > 0:
    print('양수')
elif num == 0:
    print('0')
else:
    print('음수')