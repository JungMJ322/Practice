## 이진 겁색
import random
## 함수
def binsearch(ary, fData):
    pos = -1
    start = 0
    end = len(ary)-1
    # start와 end가 같이 않을 동안
    while start <= end:
        # 배열의 중간 인덱스 min
        min = (end + start) // 2
        if fData == ary[min]:
            return min
        elif fData > ary[min]:
            start = min +1
        else:
            end = min -1
    return pos


## 전역
SIZE = 10
dataAry = [random.randint(1, 99) for _ in range(SIZE)]
findData = dataAry[random.randint(0,SIZE-1)]
dataAry.sort()


## 메인
print('배열--> ', dataAry)
position = binsearch(dataAry, findData)
if position == -1:
    print(findData, '없음')
else:
    print(findData, '가', position, '에 있음')