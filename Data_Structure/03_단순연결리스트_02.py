## 함수
# 노드 클래스
class Node():
    def __init__(self):
        self.data = None
        self.link = None

# 노드 출력
def printNode(start):
    current = start
    print(current.data, end=' ')
    while current.link != None:
        current = current.link
        print(current.data, end=' ')
    print()

# 노드 삽입
def insertNode(findData, insertData):
    global memory, head, current, pre

    # 첫 노드 앞에 삽입(다현, 화사)
    if findData == head.data:
        node = Node()
        node.data = insertData
        node.link = head
        head = node
        return
    # 두번째 노드이후 앞에 삽입 (사나, 솔라)
    current = head
    while current.link != None:
        pre = current
        current = current.link
        if current.data == findData:
            node = Node()
            node.data = insertData
            node.link = current
            pre.link = node
            return
    # 마지막 노드 삽입
    node = Node()
    node.data = insertData
    current.link = node
    return

# 노드 삭제
def deleteNode(deletedata):
    global memory, head, current, pre
    # 첫 노드를 삭제할 때
    if deletedata == head.data:
        current = head
        head = head.link
        del(current)
        return None
    # 두번째 이후를 삭제
    current = head
    while current.link != None:
        pre = current
        current = current.link
        if current.data == deletedata:
            pre.link = current.link
            del(current)
            return None

def findNode(findData):
    global memory, head, current, pre
    current = head
    if current.data == findData:
        return current
    while current.link != None:
        current = current.link
        if current.data == findData:
            return current
    return Node()

## 전역
memory = []
head, current, pre = None, None, None
dataArray = ['다현', '정연', '쯔위', '사나', '지효']

## 메인

## head 첫번째 노드 생성
node = Node()
node.data = dataArray[0]
head = node
memory.append(node)

## 두번째 노드부터 생성한 뒤 pre를 이용해 link 연결
for data in dataArray[1:]:      # ['정연', '쯔위', '사나', '지효']
    pre = node
    node = Node()
    node.data = data
    pre.link = node
    memory.append(node)

printNode(head)

# 첫번째 노드에 삽입
insertNode('다현', '화사')
printNode(head)
# 중간 노드에 삽입
insertNode('사나', '솔라')
printNode(head)
# 재남이 없음으로 마지막에 노드 삽입
insertNode('재남', '문별')
printNode(head)
# 첫번째 노드 삭제
deleteNode('화사')
printNode(head)
# 중간 노드 삭제
deleteNode('쯔위')
printNode(head)
# 삭제할 데이터가 없다면 변환 없음
deleteNode('재남')
printNode(head)
# 노드 데이터 찾기
fNode = findNode('다현')
print(fNode.data)
fNode = findNode('지효')
print(fNode.data)
fNode = findNode('재남')
print(fNode.data)