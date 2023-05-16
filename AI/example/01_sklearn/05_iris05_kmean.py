from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.cluster import KMeans

import matplotlib.pyplot as plt
import pandas as pd

# 1
iris = load_iris()
X = iris.data
y = iris.target

# 2
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size=0.3, random_state=1)

# 3
model = KMeans(n_clusters=3)

# 4
model.fit(train_X)      # X의 데이터만으로 X의 중심점을 찾기때문에 / 비지도 학습

# 5
pred = model.predict(test_X)
print(test_X)
print(pred)

# 어떻게 군집한건지 그려보자.
df = pd.DataFrame(test_X)
df.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width']
df['category'] = pd.DataFrame(pred)

centers = pd.DataFrame(model.cluster_centers_)
centers.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width']
center_X = centers['sepal_length']
center_y = centers['sepal_width']

plt.scatter(df['sepal_length'], df['sepal_width'], c=df['category'])
plt.scatter(center_X, center_y, s=100, c='r', marker='*')
plt.show()
