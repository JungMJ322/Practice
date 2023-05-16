# pip install pandas as pd
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures
import matplotlib.pyplot as plt
import numpy as np



# <1. 데이터 준비>
# df = pd.read_csv('soldiers.csv', encoding='euc-kr')
# print(df)
# 날짜, 키, 몸무게 만 가지고 오고 싶음
names = ['순번', 'date', '가슴둘레', '소매길이', 'height', '허리둘레', '샅높이', '머리둘레', '발길이', 'weight']
# names로 컬럼이름을 변경함
df = pd.read_csv('soldiers.csv', encoding='euc-kr', names=names, header=0, low_memory=False)
# print(df)
df = df[['date', 'height', 'weight']]
# print(df)
# print(len(df))
df.dropna(inplace=True)         # inplace df(원본)에 dropna한 결과를 적용
# print(len(df))

# 연도만 남기자!
df['date'] = list(map(lambda x: int(str(x)[:4]) if len(str(x)) > 4 else x, df['date']))
# print(df)
# 2013: 0 / 2014: 1 / ... / 2017: 4
df['date_new'] = list(map(lambda x: 0 if x==2013 else 1 if x==2014 else 2 if x==2015 else 3 if x==2016 else 4, df['date']))

# 키를 float으로 바꾸자! (cm도 제거하자) / str(x).split(' ')[0]
df['height'] = list(map(lambda x: float(str(x)[:5]) if len(str(x)) > 5 else x, df['height']))
# print(df)

# 몸무게를 float으로 바꾸자! (kg도 제거하자) / 빈문자열 '' 빈 리스트[] 빈 튜플{} 은 다 false
df['weight'] = list(map(lambda x: str(x).split(' ')[0], df['weight']))
df['weight'] = list(map(lambda x: float(x) if x else None, df['weight']))
df.dropna(inplace=True)
# print(df)
# print(len(df))

X = df[['weight', 'date_new']]
y = df['height']        # 몸무게를 가지고 키를 예측

# 다항회귀 (PolynormialFeatues) : 특성이 두개, 특성을 곱해서 다차원으로 변경하자
# [1, a, b, a^2, ab, b^2]   ==> 내부적으로 이형태로
poly = PolynomialFeatures()
X = poly.fit(X).transform(X)


# <2. 데이터 분할>
# train_x, test_x
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size=0.3, random_state=1)
# print(train_X)
# print(train_y)

# train_X = train_X.values.reshape(-1, 1)   X가 이미 [[][][]]의 형태가 되었음으로 reshape안해줘도 됨
# test_X = test_X.values.reshape(-1, 1)

# <3. 준비>
# sklearn은 이 class면 되는데 원래는 더 많아야함
linear = LinearRegression()

# <4. 학습>
linear.fit(train_X, train_y)        # 알아서 X에 대한 y값을 학습함  y = H(x) / 가설을 만듬

# 5. 예측
predict = linear.predict(test_X)
print(test_X)
print(predict)

print(linear.predict(poly.fit(np.array([[70, 0]])).transform(np.array([[70, 0]]))))


plt.plot(test_X, test_y, 'b.')
plt.plot(test_X, predict, 'r.')

plt.xlim(20, 150)
plt.ylim(150, 220)
plt.grid()

plt.show()
