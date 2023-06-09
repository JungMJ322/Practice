import seaborn as sns
import matplotlib.pyplot as plt

penguins = sns.load_dataset('penguins')
# print(penguins)

'''
species : 종
island : 서식지
bill_length_mm : 부리의 길이
bill_depth_mm : 부리의 깊이
flipper_length_mm : 날개의 길이
body_mass_g : 체질량
sex : 성별
'''

#  ecdf : 경험정 누적분포함수(확률변수가 일정한 값을 넘지 않다는 것을 유추하는 함수)
sns.ecdfplot(data=penguins.filter(like='bill_', axis='columns'))
plt.show()