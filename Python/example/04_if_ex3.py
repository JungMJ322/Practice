# 문제 : 점수를 입력받아서 학점 출력 A, B, C, D, F
# 점수를 입력 받는다
grade = float(input('점수를 입력하시오 : '))

# 점수에 따라 문자를 출력한다
if grade > 100:
    print('error')
elif grade >= 90:
    print('A')
elif grade >= 80:
    print('B')
elif grade >= 70:
    print('C')
elif grade >= 60:
    print('D')
else:
    print('F')