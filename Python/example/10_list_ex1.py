# 1번 : 이메일 형식 판별
email = input('이메일 입력: ')
if (email.find('@') == -1 or email.find('.') == -1 or
    email.index('@') > email.index('.') or
    email.index('.') - email.index('@') < 2 or
    email.index('@') == 0 or email.index('.') == len(email)-1 or
    email.count('@') > 2 or email.count('.') > 2) :
    print('이메일 형식이 아닙니다.')
else:
    print('이메일 형식 입니다.')
print('입력한 이메일: ', email)


# 2번 : 숫자만 추출해서 총 합계 구하기
str_data = "{a1:20}, {a2:30}, {a3:15}, {a4:50}, {a5:-14}," \
           "{a6:15}, {a7:20}, {a8:70}, {a9:-100}"

str_data_num = []
str_data_close = 0

while str_data_close != len(str_data)-1:
    str_data_colon = str_data.find(':', str_data_close)
    str_data_close = str_data.find('}', str_data_colon)
    str_data_num.append(int(str_data[str_data_colon+1:str_data_close]))

print(str_data_num)
print(sum(str_data_num))


# # 3번 : 입력한 숫자만큼 하트 출력
num = input('숫자를 여러개 입력하세요.')
for i in range(len(num)):
    for j in range(int(num[i])):
        print('\u2665', end='')
    print()
