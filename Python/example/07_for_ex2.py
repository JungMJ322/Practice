# 구구단의 단수를 입력받아서 구구단을 출력하기
gugu = int(input('단수 입력 : '))
ans = 0

# 입력 받은 단수 출력하기 위해 반복
for i in range(1, 10):
    ans = gugu * i
    print('{} * {} = {}'.format(gugu, i, ans))

