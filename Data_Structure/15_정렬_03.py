## 선택 정렬 1 (완전)
import random

## 함수
def selectionSort(ary):
    n = len(ary)

    for cy in range(n):
        minPos = cy
        for i in range(cy+1, n):
            if ary[cy] > ary[i]:
                minPos = i
        # cy번째와 minPos번째의 데이터 변경
        ary[cy], ary[minPos] = ary[minPos], ary[cy]

    return ary


## 전역
dataAry = [random.randint(0, 99) for _ in range(20)]


## 메인
print('정렬 전--> ', dataAry)
dataAry = selectionSort(dataAry)
print('정렬 후--> ', dataAry)