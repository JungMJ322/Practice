# pip install sklearn
from sklearn.linear_model import LinearRegression
import numpy as np
import matplotlib.pyplot as plt

# 데이터 준비
x = np.array([1, 2, 3, 4, 5])
y = np.array([2, 4, 6, 8, 10])
# 데이터 분한        / 데이터가 작아서 생략

# 모델 준비
linear = LinearRegression()
# print(x.reshape(-1, 1))       # 행을 열로만듬

# 학습
linear.fit(x.reshape(-1, 1), y)

test_x = np.array([6, 7, 8, 9, 10])

# 예측 및 평가
predict = linear.predict(test_x.reshape(-1, 1))
print(predict)

plt.plot(test_x, predict)
plt.show()