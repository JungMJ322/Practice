## 함수
# 큐가 비어있는지 확인하는 함수
def isQueueEmpty():
    global SIZE, queue, front, rear
    # rear와 front가 같을때 큐가 비어있음
    if rear == front:
        return True
    else:
        return False

# 큐가 가득차 있는지 확인하는 함수
def isQueueFull():
    global SIZE, queue, front, rear
    # rear+1와 front의 위치가 같을때 큐가 가득차있음
    if (rear+1) % SIZE == front:
        return True
    else:
        return False

# 큐에 데이터 삽입
def enQueue(data):
    global SIZE, queue, front, rear
    if isQueueFull():
        print('큐 FULL!')
        return
    rear = (rear + 1) % SIZE
    queue[rear] = data

# 큐에서 데이터 추출
def deQueue():
    global SIZE, queue, front, rear
    if isQueueEmpty():
        print('큐 텅~')
        return None
    front = (front+1) % SIZE
    data = queue[front]
    queue[front] = None
    return data

def peak():
    global SIZE, queue, front, rear
    if isQueueEmpty():
        print('큐 텅~')
        return None
    return queue[(front+1) % SIZE]

## 전역
SIZE = 5
queue = [None for _ in range(SIZE)]
front = rear = 0

## 메인
enQueue('화사')
enQueue('솔라')
enQueue('문별')
enQueue('선미')
enQueue('재남')
print('출구<---', queue, '<---입구')
print('손님 : ', deQueue())
print('손님 : ', deQueue())
print('출구<---', queue, '<---입구')
enQueue('아이유')
print('출구<---', queue, '<---입구')