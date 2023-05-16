import matplotlib.pyplot as plt

# figure 그래프 전체 도화지
fig = plt.figure()

# 그래프 몇개로 나눌 것이냐
ax = fig.subplots()

# 도화지에 그려짐
ax.plot([1, 2, 3, 4, 5])

# 도화지 화면에 보여주세요
plt.show()