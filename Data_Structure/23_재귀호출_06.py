## 22_Code10_06
## 함수
def guguDan(dan, num=1):
    if num > 9:
        return
    print(dan, ' * ', num, ' = ', dan * num)
    guguDan(dan , num+1)



## 메인
guguDan(9)

