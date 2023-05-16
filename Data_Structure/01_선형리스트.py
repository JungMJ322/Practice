## 함수 선언부
## 리스트 끝에 데이터 추가
def add_data(friend):
    katok.append(None)  # 빈칸 추가
    kLen = len(katok)
    katok[kLen-1] = friend

def insert_data(position, freiend):
    katok.append(None)  # 빈칸 추가
    kLen = len(katok)
    ## position 까지 반복
    for i in range(kLen-1, position, -1):
        katok[i] = katok[i-1]
        katok[i-1] = None
    ## data 삽입
    katok[position] = freiend   # 3

def delete_data(position):
    katok[position] = None
    kLen = len(katok)
    for i in range(position+1, kLen, 1):
        katok[i-1] = katok[i]
        katok[i] = None
    del(katok[kLen-1])


## 전역 변수부
katok = []
select = 0


## 메인 코드부
## 실전 부분
if __name__ == '__main__':
    while(select != 4):
        select = int(input('선택하세요(1: 추가, 2: 삽입, 3: 삭제, 4: 종료) '))

        if select == 1:
            data = input('추가할 데이터 --> ')
            add_data(data)
            print(katok)
        elif select == 2:
            pos = int(input('삽입할 위치 --> '))
            data = input('추가할 데이터 --> ')
            insert_data(pos, data)
            print(katok)
        elif select == 3:
            pos = int(input('삽입할 데이터 --> '))
            delete_data(pos)
            print(katok)
        elif select == 4:
            print(katok)
            exit()
        else:
            print('1~4중 하나를 입력하세요.')
            continue

# ## 02 함수를 사용해 리스트 구현
# add_data('다현')
# add_data('정연')
# add_data('쯔위')
# add_data('사나')
# add_data('지효')
# add_data('모모')
# print(katok)
#
# insert_data(3, '미나')
# print(katok)
#
# delete_data(4)
# print(katok)


## 01 리스트 구현
# katok.append(None)      # 빈칸 추가
# katok[0] = '다현'
# katok.append(None)      # 빈칸 추가
# katok[1] = '정연'
# katok.append(None)      # 빈칸 추가
# katok[2] = '쯔위'
# katok.append(None)      # 빈칸 추가
# katok[3] = '사나'
# katok.append(None)      # 빈칸 추가
# katok[4] = '지효'

# # 리스트 중간에 삽입
# # 끝에 빈공간 생성
# katok.append(None)
# # 삽입하는 위치까지 자리를 비움
# katok[6] = katok[5]
# katok[5] = None
# katok[5] = katok[4]
# katok[4] = None
# katok[4] = katok[3]
# katok[3] = None
# # 삽입
# katok[3] = '미나'     # 3