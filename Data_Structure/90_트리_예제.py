## 함수
class TreeNode():
    def __init__(self):
        self.left = None
        self.data = None
        self.right = None


## 전역
memory = []
root = None
nameAry = ['블랙핑크', '레드벨벳', '마마무', '에이핑크', '걸스데이']

## 메인

node = TreeNode()
node.data = nameAry[0]
root = node
memory.append(node)

for name in nameAry[1:]:
    node = TreeNode()
    node.data = name

    current = root
    while True:
        if current.data > name:
            if current.left == None:
                current.left = name
                break
            current = current.left
        else:
            if current.right == None:
                current.right = name
                break
            current = current.right

    memory.append(node)

print('이진 탐색 트리 완료!')

findData = '마마무'