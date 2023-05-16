import tensorflow as tf

# ===== 3번의 쪽지시험 결과가 있을때 실제 평가 결과 예측 =====
# <1. 데이터 준비>
# X_data : 3번의 쪽지시험 결과 / y_data : 실제 평가 결과
X_data = [
    [73, 80, 75],
    [93, 88, 93],
    [89, 91, 90],
    [96, 89, 100],
    [73, 66, 70]
]
y_data = [
    [80],
    [91],
    [88],
    [94],
    [61]
]

# shape=[None, 3] ==> 행이 몇개든 상관없는데 열이 3개씩 들어가야 한다. / 큰 list 개수 상관없고 작은 list는 3개씩
X = tf.placeholder(shape=[None, 3], dtype=tf.float32)
y = tf.placeholder(shape=[None, 1], dtype=tf.float32)

# <2. 가설 설정>
# [3, 1] => X와 행렬연산 해야 하기 때문
W = tf.Variable(tf.random_normal([3, 1]), name='weight')
b = tf.Variable(tf.random_normal([1]), name='bias')

# H = W * X + b     W, X가 행렬이 되서 다르게 써야함
# matmul => X, W 행렬곱 해라
H = tf.matmul(X, W) + b


# <3. 준비>
# loss function
loss = tf.reduce_mean(tf.square(H - y))

# optimizer
# 기울기가 0인지점을 못찾고 발산하는 경우가 있어 learing_rate값을 변경하여 적절한 값을 찾아야함
learning_rate = 0.00004
optimizer = tf.train.GradientDescentOptimizer(learning_rate)
train = optimizer.minimize(loss)

# session
sess = tf.Session()
sess.run(tf.global_variables_initializer())   # 변수 초기화

# <4. 학습>
epochs = 10000
for step in range(epochs):
    _, loss_val, W_val, b_val = sess.run([train, loss, W, b], feed_dict={X: X_data, y: y_data})
    if step % 100 == 0:
        print(f'W: {W_val}\tb:{b_val}\tloss:{loss_val}')

# <5. 예측>
print(sess.run(H, feed_dict={X: [[100, 80, 87]]}))