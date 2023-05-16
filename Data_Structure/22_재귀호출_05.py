## 22_Code10_06
## 함수
def printStar(num):
    if num <= 0 :
        return
    printStar(num-1)
    print('*' * num)

## 메인
printStar(5)