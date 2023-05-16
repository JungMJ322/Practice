## 함수
# 큐가 가득 찼는지 확인 하는 함수
def isQueueFull():
    global SIZE, queue, front, rear
    # 꼬리(rear)가 큐의 끝이 아닐때
    if rear != SIZE-1:
        return False
    # 꼬리(rear)가 큐의 끝이고 front가 초기값일 때
    # => 큐에 데이터가 꽉 찼을때
    elif (rear ==  SIZE-1) and (front == -1):
        return True
    else:
        for i in range(front+1, SIZE):
            queue[i-1] = queue[i]
            queue[i] = None
        front -=1
        rear -=1
        return False

## 큐에 데이터 삽입하는 함수
def enQueue(data):
    global SIZE, queue, front, rear
    # 큐가 가득 찼는지 확인
    if isQueueFull():
        print('큐 FULL!')
        return
    rear += 1
    queue[rear] = data
    return

# 큐가 비어있는지 확이하는 함수
def isQueueEmpty():
    global SIZE, queue, front, rear
    if rear == front:
        return True
    else:
        return False

# 큐에서 테이터 추출
def deQueue():
    global SIZE, queue, front, rear
    # 큐가 비어있는지 확인
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
print('밥 손님:', deQueue())
print('밥 손님:', deQueue())
print('출구<---', queue , '<--입구')
enQueue('아이유')
print('출구<---', queue , '<--입구')
# print('출구<---', queue , '<--입구')
# enQueue('아이유')
# print('출구<---', queue , '<--입구')