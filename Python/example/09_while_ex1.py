# 'stop'문자 입력될 때까지 숫자를 입력하고
# 입력된 숫자의 개수를 출력

inputN = input('숫자 입력 : ')
cnt = 0
while inputN != 'stop':             # 입력받은 문자열이 stop이 아닐시 반복
    inputN = int(inputN)
    cnt +=1
    inputN = input('숫자 입력 : ')
print('숫자 개수 : ', cnt)
