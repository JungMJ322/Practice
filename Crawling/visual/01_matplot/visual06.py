import matplotlib.pyplot as plt
from random import randint

fig, ax = plt.subplots()

x = list(randint(0, 10) for i in range(100))

# 일반 그래프 / 누적 그래프
ax.hist(x, bins=10, cumulative=True)
ax.hist(x, bins=10, cumulative=False)

plt.xticks(list(range(1, 11)))
plt.yticks(list(range(0, 101, 5)))

plt.xlim(0, 10)
plt.ylim(0, 100)

plt.show()