# AI

> Artificial Intelligence
>
> 인공(의) 지능
>
> > 인공적으로 만든 지능

- System that thinking humans
  - 기계내부에서 연산
  - 사람처럼 생각하도록
- System that act like humans
  - 기계외부로 행동
  - 사람처럼 행동하는것 처럼 보인다.
  - 인간의 행동과 컴퓨터의 행동을 구분 못하도록



## 종류

* Deep Learning
  * 인간의 뉴런을 참조
* Machine Learning
  * 함수 기반에서 데이터 기반의 프로그래밍을 가능하게 함
  * 컴퓨터가 스스로 학습
* AI
  * 컴퓨터가 인간의 사고를 모방
  * 컴퓨터와 인간을 구분하기 힘듬



- 지도 학습
  - x, y 데이터를 줘서 학습
  - 문제와 답을 알려주고 학습
  - 예측
    - Linear regression
    - 선형 회귀분석
    - 연속적인 데이터를 수치 계산을 통해 모델생성
    - 데이터들을 가장 잘 표현할 수 있는 선을 생성
  - 분류
    - Logistic regression
    - 논리 회귀분석
    - 불연속적인 데이터를 통해 확률 계산
    - binary : True / False
    - multi-label : A, B, C, D, ...등으로 분류
- 비지도 학습
  - x만 주고 y를 예측하도록 학습
- 강화학습
  - 지도자(Superviser)가 존재하지 않고, 단지 보상(Reward)만 존재
  - 행동에 대한 피드백이 즉각적이지 않고, 지연될 수 이 있음
  - 행동이 이후에 받을 데이터에 영향을 끼침


---



## ML

> Marchin Learning

- 기존 프로그래밍
  - input X ==> function ==> output Y
  - 프로그래머가 function의 형태로 Process 만드는데 주력
  - X를 입력하면 Y가 출력되도록 한다.
- 기계 학습
  - training data(x, y) + Learning = Model(Hypothesis)
  - test data X ==> Model ==> output Y
  - Data위주
  - Data를 입력하면 컴퓨터가 Process(Model)를 만들어준다.
  - x, y의 데이터를 컴퓨터에게 주면 x와 y의 관계 모델(가설)을 컴퓨터가 만든다. (test x를 주면 y가 출력되도록)
  - x, y의 관계를 만든다.
  - h(y) = W * x + b
    - 학습 : Weight(가중치) 와 bias 를 변경하는 일련의 과정



### 순서

1.  데이터 준비
    - 학습에 필요한 데이터 준비단계 (전처리)
    - 결측치, 이상치 -> 제거 / 대치 (최빈값, 평균값, 중위값)
2.  데이터 분할(가설 설정)
    - train set / test set 분리   7/3 or 8/2로 분리
    - training sets : 모델 학습용
    - validation sets : 모델 검증용 => 여러 번 평가
    - test sets : 모델 성능 평가용 => 한 번 평가
3.  준비
    - 학습에 필요한 것들 준비
    
    - 사용할 모델 결정
    - Prediction (예측)
      - Linear 
    - Classification (분류)
      - Logic
    - Clustering (군집)
      - X값만으로
4.  학습
    - 데이터를 가지고 모델 학습
    - activation function : 활성화 함수
    - loss function (cost function) : h와 y의 차이
    - optimizer : 최적화 함수
    - hyperparameter tuning : 가장 효율적인 값 선택
5.  예측 및 평가
    - 모델 검증 -> 정확도 (accuracy)
    - 정밀도 (precision) TP / TP + FP
    - 재현율 (recall) TP / TP + FN



#### 1. 데이터 준비

> 학습에 필요한 데이터 준비단계(전처리 과정)

- XML이나 csv, json파일 등의 데이터를 가지고온다.
  - 보통 csv나 json파일의 형태를 자주 사용함
- DataFrame에서 필요한 columns만 뽑아 새로운 df를 만든다.
- 결측치나 이상치를 제거한다.

``` python
names = ['순번', 'date', '가슴둘레', '소매길이', 'height', '허리둘레', '샅높이', '머리둘레', '발길이', 'weight']
df = pd.read_csv('soldiers.csv', encoding='euc-kr', names=names, header=0, low_memory=False)
# names를 통해 기존파일에 있는 columns들을 원하는 str로 변경할 수 있다.

df = df[['date', 'height', 'weight']]
# 필요한 columns만 뽑아 df로

df.dropna(inplace=True)
# Nan(결측치)를 제거한다. / inplace 기존의 df에 적용

df['date'] = list(map(lambda x: int(str(x)[:4]) if len(str(x)) > 4 else x, df['date']))
# 연도만 남기자!
```

``` python
# lambda에서 if문
lambda x: (if에서 True일때 실행) if (조건문) else (조건이 아닐때)

# elif
lambda x: (if1에서 True일때 실행) if (조건문1) else (if1조건이 아니고 if2조건 일때) if (조건문2) else (조건1, 2모두 아닐때)

df['date_new'] = list(map(lambda x: 0 if x==2013 else 1 if x==2014 else 2 if x==2015 else 3 if x==2016 else 4, df['date']))
```



##### PolynomialFeatures

> from sklearn.preprocessing import PolynomialFeature
>
> 다항회귀
>
> > 데이터들간의 형태가 비선형 일때 데이터에 각 특성의 제곱을 추가해주어서 특성이 추가된 비선형 데이터를 선형 회귀 모델로 훈련시키는 방법

* 다항식, 상호작용하는 특성을 생성
* 입력 샘플이 2차원이고 [a, b]형태인 경우
* 2차수 다항식의 특징은  [1, a, b, a^2, ab, b^2]

``` python
class sklearn.preprocessing.PolynomialFeatures(degree=2, *, interaction_only=False, include_bias=True, order='C')
```

* **degree**
  * int, tuple
  * default = 2
  * 다항식 특징의 최대 차수
  * tuple `(min_degree, max_degree)`
  * 0이나 1은 기존 bias랑 같음
* interaction_only
  * bool
  * default = False
  * True이면 상호 작용 기능만 생성
  * 제곱이 2이상인 값들은 제외
* order
  * {'C', 'F'}
  * default = 'C'
  * 밀도가 높은 경우 출력 배열 순서입니다. 'F' 차수는 계산 속도가 빠르지만 후속 추정기를 느리게 할 수 있음

**Methods**

- **fit**
  - 출력 기능의 수를 계산
- **transform**
  - 데이터를 다항식 피쳐로 변환



#### 2. 데이터 분할

- 모델학습과 검증을위해 데이터를 분할함
- train set / test set 을   7/3 or 8/2로 분리
- 데이터 수가 부족할 경우 안하는 경우도 있음

##### train_test_split

> from sklearn.model_selection import train_test_split

- 배열 또는 행렬을 임의의 train으로 분할하고 하위 집합을 test할 수 있음

```python
sklearn.model_selection.train_test_split(*arrays, test_size=None, train_size=None, random_state=None, shuffle=True, stratify=None)

# 예
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size=0.3, random_state=1)
```

- ***arrays**
  - 길이 형태가 동일한 sequence들
  - numpy배열, scipy-sparse 행렬, pandas dataframes
- **test_size**
  - float 또는 int
  - default = None
  - 데이터들중 test set의 비율을 정할 수 있음
- train_size
  - test_size와 동일(train set의 비율을 정할 수 있음)
- **random_state**
  - int
  - 랜덤 시드 지정
- **shuffle**
  - bool
  - default = True
  - 데이터들을 섞을지 여부를 선택
- stratify
  - default = None
  - None이 아닌경우 클래스 레이블로 사용하여 계층화된 방식으로 분할



#### 3. 준비

- 학습에 필요한 것들 준비
- 사용할 모델 결정



**종류**

##### LinearRegression

> from sklearn.linear_model import LinearRegression
>
> 예측

- 연속적인 데이터들을 수치계산
- 일반 최소 제곱 선형 회귀
- 이 모형에 대한 절편을 계산할지 여부

```python
linear = LinearRegression()
```

- fit_intercept
  - bool, default = True
  - False로 설정하면 계산에 절편이 사용되지 않음(즉, 데이터가 중앙에 배치될 것으로 예상됨)
- normalize
  - bool, default = False
  - True일경우 정규화를 진행
- copy_X
  - bool, default = True
  - True이면 X가 복사되고, 그렇지 않으면 덮어쓸 수 있다
- n_jobs
  - int, default = None
  - 계산에 사용할 작업 수
- positive
  - bool, default = False
  - True면 계수가 강제로 양수가 됨
  - 고밀도 배열에만 지원



##### K-NeighborsClassifier

> from sklearn.neighbors import KNeighborsClassifier
>
> 분류

- 입력값에서 가장 가까운 k개의 데이터를 비교
- k개 중 가장 많은 class로 분류
- 일반적으로 k는 홀수

```python
model = KNeighborsClassifier()
```

- n_neighbors
  - int, default = 5
  - 인접한 항목 수
- algorithm
  - {‘auto’, ‘ball_tree’, ‘kd_tree’, ‘brute’}, default = ’auto’
  - 알고리즘 선택
- leaf_size
  - int, default = 30
  - ball_tree나 kd_tree에 필요한 파라메터 같음
  - 최적의 값은 문제의 특성에 따라 달라짐
- p
  - int, default = 2
  - 1일때 manhattan_distance
  - 2일때 euclidean_distance

- metric
  - str 또는 callable, default = 'minkowski'
- metric_params
  - dic, default = None
  - 메트릭 함수에 대한 추가 키워드 인수
- n_jobs



##### SVM

> from sklearn.svm import SVC
>
> Support Vector Machine
>
> 분류

- Margin(a와 b의 간격)이 최대화가 되는 결정 경계(초평면)를 정의
- Hard Margin SVM : 이상치(Outlier)를 허용하지 않음 (overfitting)
- Soft Margin SVM : 이상치를 어느정도 허용 (underfitting)
- Kernel Trick : 차원을 추가하여 분류

```python
model = SVC(kernel='linear')
```

- kernel

  - {‘linear’, ‘poly’, ‘rbf’, ‘sigmoid’, ‘precomputed’} or callable
  - default = ’rbf’

  

##### Decision Tree

> from sklearn.ensemble import RandomForestClassifier
>
> 분류, 앙상블

- 의사결정 트리
- 질문(Node)에 대한 답(True / False)를 반복하여 분류
- 불순도(impurity)가 낮아지는 방향으로 진행
- 질문이 너무 많아지는 경우 과적합(overfitting)에 빠질 수 있

```python
model = RandomForestClassifier()
```

- n_estimator
  - int, default = 100
  - 숲에 있는 나무수

**Ensemble**

> 여러 개의 모델을 결합하여 결과 도출

- Voting
  - 각각 다른 모델들의 결과를 다수결로 선택
- Bagging
  - 같은 모델을 여러 개 병렬로 실행하여 선형 결합
- Boosting
  - 가벼운 모델을 순차적으로 학습하여 결과 도출



##### K-mean

> K(clusters) => 분류하고자 하는 갯수
>
> from sklearn.cluster import KMeans
>
> 비지도 학습

- k개의 중심(centroid)을 랜덤으로 지정
  - 데이터들을 가장 가까운 그룹(cluster)에 할당
  - 위의 단계를 반복하여 변경되는 데이터가 없을 때 까지 반복
- 각 데이터의 그룹과 중심의 거리 차이의 분산을 최소화
  - 처음에는 랜덤으로 점이 생성되지만
  - 반복되면서 그룹의 중심으로 이동한다.

```python
model = KMeans(n_clusters=3)
```

- n_clusters
  - int, default = 8
  - 형성할 클러스터의 수와 생성할 중심의 수



#### 4. 학습

- 데이터를 가지고 모델 학습

```python
model.fit(train_X)
```



#### 5. 예측 및 평가

- 모델 검증
- 정확도(accuracy)

```python
# 검증
pred = model.predict(test_X)

# 정확도
model.score(test_X, test_y)
```



**np.rabel**

- 1차원 배열로 압축



## DL

> Deep Learning
>
> Deep Neural Network
>

* input layer와 output layer 사이이에 hidden layer가 추가된다.
* 인간의 신경 전달 세포(Neuron)에서 착안된 개념
* Multi-Layer Perceptron
  * ![image-20230421221614603](C:\Users\mmhye\AppData\Roaming\Typora\typora-user-images\image-20230421221614603.png)




- 순전파
  - foward propagation
  - 입력 => 출력 순으로 계산
- 역전파
  - back propagation
  - 계산된 결과를 가지고 출력 => 입력 순으로 가중치를 변경
  - gradient(기울기)를 찾는 과정(=학습)의 속도가 빨라짐



- RNN
  - Recurrent Neural Network
  - 이전 단계의 결과를 다음 단계의 입력으로 사용
- CNN
  - Convolutional Neural Network
- GAN
  - Generative Adversarial Network
  - generator와 discriminator를 경쟁시키며 학습



## RL

> Reinforcement Learning

- 긍정적인 행동 => 보상 => 행동의 반복(상호작용) => 행동의 교정
- 환경(environment)에서 행동자(agent) 보상(reward)을 얻기위해 현재의 상태(state)를 변경시키는 반복적인 행동(action)을 함
  - envireonment - state들의 집합 / action 행동 정의
  - agent(actor) - 행동의 주체
  - action - environment에 정의되어 있는 기능을 agent가 수행
  - state - environment에서 agent의 현재 상태
  - reward - 반복적인 action을 통해 획등하려는 결과

