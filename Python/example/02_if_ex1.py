# 문제 : id와 password를 입력받아 로그인 성공 출력
#       둘중 하나라도 틀릴시 실패 출력
# id : multicampus
# pw : 1234
id = input('ID 입력 : ')
pw = int(input('PW 입력 : '))

# 논리 연산자 and를 사용하여 id나 pw둘중 
# 하나라도 틀릴경우 로그인 실패하도록
if (id == 'multicampus') and (pw == 1234):
    print('로그인에 성공하셨습니다.')
else:
    print('로그인에 싫패하셨습니다.')
