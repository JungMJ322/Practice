# ===== iris의 data를 이용해 세부종이 무엇인지 확인 =====
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

import pandas as pd
import matplotlib.pyplot as plt

# <1. 데이터 준비>
iris = load_iris()
# print(iris)
# print(iris.data)
# print(iris.feature_names)
# print(iris.target)          # 붓꽃의 세부 종류
# print(iris.target_names)

X = iris.data
y = iris.target

# ['sepal length (cm)', 'sepal width (cm)', 'petal length (cm)', 'petal width (cm)']
# ['setosa' 'versicolor' 'virginica']

df = pd.DataFrame(X)
df.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width']
df['category'] = pd.DataFrame(iris.target_names[y].reshape(-1))

# print(df)
'''
groups = df.groupby('category')
fig, ax = plt.subplots()
for name, group in groups:
    ax.scatter(group.sepal_length, group.sepal_width, marker='.', label=name)

ax.legend()
plt.xlabel('sepal length')
plt.ylabel('sepal width')
plt.show()
'''
# <2. 데이터 분할>
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size=0.3, random_state=1)

# <3. 준비>
logistic = LogisticRegression()

# <4. 학습>
logistic.fit(train_X, train_y)

# <5. 예측>
pred = logistic.predict(test_X)

for i in range(len(test_X)):
    print(f'{test_X[i]} 예측: {iris.target_names[pred[i]]} / 실제: {iris.target_names[test_y[i]]}')

print(f'acc: {logistic.score(test_X, test_y)}')
