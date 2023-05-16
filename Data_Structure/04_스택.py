## 함수


## 전역
#stack = [None, None, None, None, None]
SIZE = 5
stack = [None for _ in range(SIZE)]     # 위처럼 하나씩 만든것과 동일
top = -1

## 메인

# PUSH
top += 1
stack[top] = '커피'
top += 1
stack[top] = '녹차'
top += 1
stack[top] = '꿀물'
print(stack)

# POP
data = stack[top]
stack[top] = None
top -= 1
print('pop data -->', data)
data1 = stack[top]
stack[top] = None
top -= 1
print('pop data -->', data1)
data2 = stack[top]
stack[top] = None
top -= 1
print('pop data -->', data2)
print(stack)