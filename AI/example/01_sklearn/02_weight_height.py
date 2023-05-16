# ====== 몸무계별 키 예측 ======
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

import matplotlib.pyplot as plt


# <1. 데이터 준비>
df = pd.read_csv('weight_height.csv', encoding='euc-kr')
# print(df)

# 학교명, 학년, 성별, 키, 몸무게
df = df[['학교명', '학년', '성별', '키', '몸무게']]
# print(len(df))
df.dropna(inplace=True)
# print(len(df))
# print(df)

# 초등학교: 0 / 중학교: 6 / 고등학교: 9 + 학년
# 0 if x[-4:] == '초등학교' else 6 if x[-3:] == '중학교' else 9
df['grade'] = list(map(lambda x : 0 if '초등' in x else 6 if '중학' in x else 9, df['학교명'])) + df['학년']
# print(df[6000:7000])

df.drop(['학교명', '학년'], axis='columns', inplace=True)
df.columns = ['gender', 'height', 'weight', 'grade']
# print(df)

# gender 남: 0 / 여: 1
# df['gender'] = list(map(lambda x: 0 if x=='남' else 1, df['gender']))
df['gender'] = df['gender'].map(lambda x: 0 if x=='남' else 1)       # map({'남' : 0, '여' : 1})
# print(df)

is_boy = df['gender'] == 0
boy_df, girl_df = df[is_boy], df[~is_boy]

X = boy_df['weight']
y = boy_df['height']

# <2. 데이터 분할>
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size=0.3, random_state=1)
train_X = train_X.values.reshape(-1, 1)
test_X = test_X.values.reshape(-1, 1)

# <3. 준비>
linear = LinearRegression()

# <4. 학습>
linear.fit(train_X, train_y)

# <5. 예측>
predict = linear.predict(test_X)
print(test_X)
print(predict)

print(linear.predict([[70]]))

plt.plot(test_X, test_y, 'b.')
plt.plot(test_X, predict, 'r.')

plt.xlim(10, 140)
plt.ylim(100, 220)

plt.show()

# 여학생 예측모델도 시각화 해봐라