# 도형을 선택해서 면적 구하기

# 어떤 도형인지 선택
rec = int(input('도형 입력(1.사각형, 2.삼각형, 3.원) : '))

# 도형에 따라 x, y 입력받아 면적 계산후 출력
if rec == 1:
    x = int(input('가로 입력 : '))
    y = int(input('세로 입력 : '))
    w = x*y
    print('사각형의 면적 = %d' %w)
elif rec == 2:
    x = int(input('밑변 입력 : '))
    y = int(input('높이 입력 : '))
    w = x * y / 2
    print('삼격형의 면적 = %d' % w)
elif rec == 3:
    x = int(input('반지름 입력 : '))
    w = x ** 2 *3.14
    print('삼격형의 면적 = %d' % w)