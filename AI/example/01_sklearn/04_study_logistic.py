# ===== 몇시간 공부하고 몇시간 과외를 받았더니 fail / pass =====
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

import numpy as np

# <1. 데이터 준비>
# [1, 0] : 1시간 공부했고, 0시간 과외했다. => [0]: fail
# [8, 1] : 8시간 공부했고, 1시간 과외했다. => [1]: pass
X = [
    [1, 0],
    [2, 0],
    [5, 1],
    [2, 3],
    [3, 3],
    [8, 1],
    [10, 0]
]

y = [
    [0],
    [1],
    [0],
    [0],
    [1],
    [1],
    [1],
]

# <2. 데이터 분할>
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size=0.3, random_state=1)

# <3. 준비>
logistic = LogisticRegression()

# <4. 학습>
logistic.fit(train_X, np.ravel(train_y))        # np.ravel이 뭘까? (예측: 리스트의 0,1은 논리값이 아니지만 ravel로 이를 변경해주는듯?)

# <5. 예측>
pred = logistic.predict(test_X)

for i in range(len(test_X)):
    print('{} 시간 공부 {}  시간 과외: {}'.format(test_X[i][0], test_X[i][1], 'pass' if pred[i] == 1 else 'fail'))

print('acc: ', logistic.score(test_X, test_y))