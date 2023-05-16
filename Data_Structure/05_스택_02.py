## 함수
# 스텍이 가득 차있는지 확인
def isStackFull():
    global SIZE, stack, top
    if top >= SIZE - 1:
        return True
    else:
        return False

def push(data):
    global SIZE, stack, top
    if isStackFull():
        print('스텍 FULL!')
        return None     # 일관성을 위해 None을 return하는 것이 좋음
    top += 1
    stack[top] = data
    return

# 스텍이 비어있는지 확인
def isStackEmpty():
    global SIZE, stack, top
    if (top <= -1):
        return True
    else:
        return False

def pop():
    global SIZE, stack, top
    if isStackEmpty():
        print('스택 텅~')
        return None
    data = stack[top]
    stack[top] = None
    top -= 1
    return data

# 맨위에 어떤 data가 있는지 확인
def peak():
    global SIZE, stack, top
    if isStackEmpty():
        print('스택 텅~')
        return None
    return stack[top]

## 전역
SIZE = 5
stack = [None for _ in range(SIZE)]     # 위처럼 하나씩 만든것과 동일
top = -1

## 메인
push('커피1')
push('커피2')
# push('커피3')
# push('커피4')
# push('커피5')
print(stack)
# push('커피6')

print('다음예정 -->', peak())

retData = pop()
print('팝 -->', retData)
retData = pop()
print('팝 -->', retData)
retData = pop()
print('팝 -->', retData)
print(stack)
