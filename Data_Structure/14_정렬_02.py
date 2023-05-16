## 선택 정렬 1 (완전)
import random

## 함수
def findMinIndex(ary):
    minIdx = 0
    for i in range(1, len(ary)):
        # minIdx이 인덱스인 배열의 값이 i가 인덱스인 배열의 값보다 작을때
        if ary[minIdx] > ary[i]:
            minIdx = i

    return minIdx

## 전역
before = [random.randint(0, 99) for _ in range(20)]
after = []

## 메인
print('정렬 전--> ', before)
for _ in range(len(before)):
    minPos = findMinIndex(before)
    # 다른 리스트인 after에 최소 값 저장
    after.append(before[minPos])
    del(before[minPos])


print('정렬 후--> ', after)