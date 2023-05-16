## 22_Code10_05
## 함수
def countDown(num):
    if num == 0:
        print('발사!!!')
        return
    print(num)
    countDown(num-1)

## 메인
countDown(5)