import seaborn as sns
import matplotlib.pyplot as plt

car_crashes = sns.load_dataset('car_crashes')
car_crashes.sort_values('total', ascending=False, inplace=True)

plt.figure(figsize=(15, 10))
sns.barplot(data=car_crashes, x='abbrev', y='total', facecolor='w', edgecolor='black')

sns.barplot(data=car_crashes, x='abbrev', y='speeding', color='r', alpha=0.3, label='speeding')
sns.barplot(data=car_crashes, x='abbrev', y='alcohol', color='b',  alpha=0.3, label='alcohol')
sns.barplot(data=car_crashes, x='abbrev', y='no_previous', color='g',  alpha=0.3, label='no_previous')

plt.xlim(-1, 51)
plt.show()

'''
각 주별로 전체 사고난 비율 별
과속, 음주, 처음 사고 비율
bar로 했을때 더 보기 편함
시각화 할때 이 데이터에 맞는 그래프는 무엇일까 생각하면서 해야함
'''