## 함수
def factNumber(num):
    if num <= 1:
        return 1
    return num * factNumber(num-1)

## 메인
print(factNumber(4))