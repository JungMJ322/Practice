import matplotlib.pyplot as plt
from random import randint
import numpy as np

fig, ax = plt.subplots()

x = list(randint(0, 1000) for i in range(10))
print(x)
print(f'평균: {np.mean(x)}')
print(f'중위값: {np.median(x)}')       # 가장 가운데 있는 수 / 평균값과 중위값은 다름

ax.boxplot(x)

plt.show()