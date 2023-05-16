## 순차 검색
import random
## 함수
def seqsearch(ary, fData):
    pos = -1
    size = len(ary)
    # 배열 데이터 하나씩 fData와 비교하다가 같으면 루프 탈출
    for i in range(size):
        if ary[i] == fData:
            pos = i
            break
    # fData와 같은 것이 없으면 -1 return
    return pos

## 전역
SIZE = 10
dataAry = [random.randint(1, 99) for _ in range(20)]
findData = dataAry[random.randint(0,SIZE-1)]

## 메인
print('배열--> ', dataAry)
position = seqsearch(dataAry, findData)
if position == -1:
    print(findData, '없음')
else:
    print(findData, '가', position, '에 있음')