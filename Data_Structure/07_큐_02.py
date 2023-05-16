## 함수
def isQueueFull():
    global SIZE, queue, front, rear
    if rear == SIZE-1:
        return True
    else:
        return False

def enQueue(data):
    global SIZE, queue, front, rear
    if isQueueFull():
        print('큐 FULL!')
        return None
    rear += 1
    queue[rear] = data
    return

def isQueueEmpty():
    global SIZE, queue, front, rear
    if rear == front:
        return True
    else:
        return False

def deQueue():
    global SIZE, queue, front, rear
    if isQueueEmpty():
        print('큐 텅~')
        return None
    front += 1
    data = queue[front]
    queue[front] = None
    return data

def peak():
    global SIZE, queue, front, rear
    if isQueueEmpty():
        print('큐 텅~')
        return None
    return queue[front+1]


## 전역
SIZE = 5
queue = [None for _ in range(SIZE)]
front = rear = -1

## 메인
enQueue('화사')
enQueue('솔라')
enQueue('문별')
enQueue('선미')
enQueue('재남')
# print('출구<---', queue, '<---입구')
# enQueue('아이유')

print('출구<---', queue, '<---입구')
print('손님 : ', deQueue())
print('손님 : ', deQueue())
print('출구<---', queue, '<---입구')
print('손님 : ', deQueue())
print('대기자 : ', peak())