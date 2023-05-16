# Python

>1. 파이썬 특징: 스크립트 언어, 동적 타입 언어, 플랫폼 독립적
>
>2. 장점: 사용이 쉬움, 빠른 개발속도, 높은 확장성 및 이식성
>
>   2.1. 스크립트 언어(Script Language) 파이썬은 스크립트 언어로 컴파일 과정없이 인터프리터에 의해 실행 결과를 바로 확인하고 수정하며 코드를 작성한다.
>
>3. 단점: 느리다(컴파일 언어에 비해) + GIL
>
>4. 파이썬은 전공자는물론 비전공자에게도 사랑받는 아주 인기있는 언어이다. 특히, 최근들어 데이터 분석을 python으로 많이 하게 되면서 더욱 인기를 끌고 있다.



레퍼런스

* * `Reference` : 참조
  * `값`(객체)이 저장된 메모리의 위치를 가리킴

* 동적 타이핑
  
  * 값이 형태에 따라서 고정되지 않음
  * 동적으로 자료 유형을 맵핑해서 사용
  
  ```python
  type('변수명')
  ```

---





## 변수

### 변수 이름

1. 대소문자 구분
   
   * C언어 기반
   
   ```python
   # 둘은 다른 변수
   X, x = 10, '엑스'
   ```

2. 중간에 공백 X
   
   * 영문자, 숫자, 밑줄(`_`) 을 사용할 수 있다.
   
   ```python
   # snake 형태
   std_name
   # camel 형태
   stdName
   ```

3. 예약어는 변수명을 사용할 수 없다.
   
   * 기존에 등록되어 있는 함수명 같은것들을 변수명으로 사용할 수 없음
   
   

### 변수 정의 형태

* 변수 값 저장
  
  * 할당 `assign`
  
  ```python
  # 변수 선언 -> 변수 = 값
  variable = value
  # 여러 변수 한번에 선언 -> 변수1, 변수2, 변수3 = 값1, 값2, 값3
  variable1, variable2, variable3 = value1, value2, value3
  # 여러 변수를 한 값으로 선언 -> 변수1 = 변수2 = 값
  variable1 = variable2 = value
  ```

​	

### 변수값 교환

* Swap

```python
a, b = 1, 2
# swap
a, b = b, a            # a와 b의 값이 변경된다
```

​	

### 변수 삭제

* del

```python
a = 3
# 변수 할당 삭제
del a
```



- [변수선언 예제](https://github.com/JungMJ322/Python/blob/main/example/01_variable.py)

---





## 연산자

| 연산자    | 기호                                          |
| ------ | ------------------------------------------- |
| 산술 연산자 | `+`, `-`, `*`, `/`, `//`(몫 반환), `%`(나머지 반환) |
| 관계 연산자 | `>`, `<`, `>=`, `<=`, `==`, `!=`            |
| 논리 연산자 | `and`, `or`                                 |
| 비트 연산자 | `&`, `                                      |

---





## 조건문

* 조건이 `True`이면 실행내용을 실행하고 `False`이면 실행하지 않는다.

```python
if (조건):
    실행내용
elif (조건):
    실행내용
else:
    실행내용
```



- [조건문 예제 1](https://github.com/JungMJ322/Python/blob/main/example/02_if_ex1.py)
- [조건문 예제 2](https://github.com/JungMJ322/Python/blob/main/example/03_if_ex2.py)
- [조건문 예제 3](https://github.com/JungMJ322/Python/blob/main/example/04_if_ex3.py)
- [조건문 예제 4](https://github.com/JungMJ322/Python/blob/main/example/05_if_ex4.py)

---





## 반복문

### for문

* 리스트(딕셔너리, 튜플 등등) 또는 범위(range())만큼 반복하는 함수
  
  ```python
  for (변수) in (범위):
      반복문장
      ...
  ```

- [for문 예제 1](https://github.com/JungMJ322/Python/blob/main/example/06_for_ex1.py)
- [for문 예제 2](https://github.com/JungMJ322/Python/blob/main/example/07_for_ex2.py)
- [for문 예제 3](https://github.com/JungMJ322/Python/blob/main/example/08_for_ex3.py)



### while 문

* 초기값이 주어진 상태에서 조건이 `True`면 반복하고 `False`면 반복을 멈추는 함수
  
  ```python
  초기값
  while (조건):
      반복문장
      ...
      초기값 증감
  ```

- [while문 예제 3](https://github.com/JungMJ322/Python/blob/main/example/09_while_ex1.py)



### break & continue

* continue
  * 현재 시점을 중단하고 다음 반복을 실행
* break
  * 반복을 중단하고 반복문 다음 줄을 실행

---





## 자료형

* 정수`integer` 
  
  | 진수   | 형태     |
  | ---- | ------ |
  | 10진수 | 14     |
  | 2진수  | 0b1110 |
  | 8진수  | 0o16   |
  | 16진수 | 0xE    |

* 실수
  
  * 3.14, 1.2e3

* 문자열
  
  * `' '`, `" "`

* 논리`bool`: True, False



### 강제 형변환

| 함수     | 내용        |
| ------ | --------- |
| int()  | 정수형으로 형변환 |
| flat() | 실수형으로 형변환 |
| str()  | 문자열로 형변환  |



### 문자열 함수

> 문자`chr`들의 집합
> 
> '안녕하세요' 처럼 `''`사이에 있는 글자들을 말한다.

1. slicing(슬라이싱)
   
   ```python
   # string 문자열의 n번째 부터 m-1번째가지 가지고 온다
   string[n:m]        #문자열(str)을 return
   ```

2. in / not in
   
   * 문자열 내에 특정한 문자열이 포함되어 있는지 확인
   * return : bool ( True, False )

3. .count()
   
   * 문자열 내에 들어있는 특정 문자(열)의 개수 반환
   
   ```python
   string.count('특정 문자(열)')
   ```

4. .find()
   
   * 문자열 내에서 특정 문자(열)이 존재하면 문자열의 시작 위치를 반환
   * 존재하지 않으면 `-1` 반환
   * return : int
   
   ```python
   string.find('찾을문자(열)' [, start(시작 index) [, end(끝 index)]])
   ```

5. .split()
   
   * 문자(열)을 찾아 이것을 기점으로 나눔
   * return : list
   
   ```python
   string.split('기준 문자(열)')
   # 문자열에 아무것도 넣지 않는다면 공백(스페이스, 탭, 엔터 등)을 기준으로 문자열을 나누어 준다
   strign.split()
   ```

6. .join()
   
   * 문자열 결합(삽입) 
   * 각 문자 사이에 특정 문자(열) 삽입하여 결합
   * return : str
   
   ```python
   string.join('문자열 마다 string 문자열을 삽입할 문자열')
   # ex
   string = '2000/02/01'
   string_sp = string.join('안녕하세요')
   print(string_sp)
   print(type(string_sp))
   ```
   
   ![image-20220101162014688](Python.assets/image-20220101162014688.png)

7. .replace()
   
   * 전체 문자열에서 특정 문자열을 찾아서 다른 문자열로 변경
   * 찾는 문자열이 존재하면 변경한 문자열로 반환
   * 찾는 문자열이 없는 경우 원래 문자열 반환
   * return : str
   
   ```python
   string.replace('찾는문자열', '변경할문자열')
   ```

8. 대소문자 변경
   
   | 함수           | 내용(stirng.함수()의 형태)       |
   | ------------ | ------------------------- |
   | upper()      | 대문자로 변경                   |
   | lower()      | 손문자로 변경                   |
   | capitalize() | 문장의 첫번째 문자열의 첫문자를 대문자로 변환 |
   | title()      | 각 단어의 첫문자를 대문자로 변경        |
   | swapcase()   | 대문자는 소문자로, 소문자는 대문자로 변경   |

9. 공백제거
   
   | 함수       | 내용(stirng.함수()의 형태) |
   | -------- | ------------------- |
   | strip()  | 문자열의 앞뒤의 공백을 제거     |
   | lstrip() | 문자열의 왼쪽의 공백을 제거     |
   | rstrip() | 문자열의 오른쪽의 공백을 제거    |

10. 문자열 구성 파악
    
    | 함수        | 내용(stirng.함수()의 형태)      |
    | --------- | ------------------------ |
    | isalpha() | 문자 여부 결과 반환(True, False) |
    | isdigit() | 숫자인지 결과 반환               |
    | isspace() | 하나의 문자에 대하여 공배여부 반환      |
    | isalnum() | 문자 또는 숫자인지 확인            |
    | islower() | 소문자여부                    |
    | isupper() | 대문자여부                    |

---





### 리스트

> 집학적 자료형
> 
> 여러 개의 원소를 가지는 데이터

* 가변적
  
  * 삽입, 삭제, 변경 가능

* 다양한 형식의 데이터
  
  * 숫자, 문자열, 논리

* `[]`를 이용해 list를 만든다

* 리스트 인덱싱
  
  * 리스트의 인덱스를 이용하여 접근
  * list[index_id]

* 리스트 복사
  
  > Python의 변수 선언 형태는 주소의 값을 참조하는 형태이기 때문에list1 = list2라고 하더라도 list의 값이 복사되어 list1의 값이 되는것이 아닌 list2의 값이 저장된 주소를 list1이 참조하는 형태이다.
  > 
  > 그렇기 때문에 깊은 복사(deep copy)할 때는 다른 방식으로 해야한다.
  
  * `list()`함수 또는 `copy`모듈의 `deepcopy()`함수를 사용해야 한다.



#### 리스트 연산

| 연산자 | 내용          |
| --- | ----------- |
| `+` | 리스트 합치기     |
| `*` | 리스트 곱하기(반복) |



#### 리스트 slicing

> 문자열 slicing과 같이 `[]`를 이용해 한다.

* return 값 : list
  
  ```python
  # list의 n번째 부터 m-1번째가지 가지고 온다
  list[n:m]        #문자열(list)을 return
  ```



#### 리스트의 메소드

1. .insert(index, value)
   
   * 리스트의 원하는 위치에 값을 삽입

2. .remove(value)
   
   * 지정한 값을 제거
   * 동일한 값이 여러개 있다면, index가 가장 작은 값만 제거
   * 동일한 값은 한번에 제거할 수 없다.
   * 제거하려는 값이 없으면 `Error` 발생

3. .pop([index])
   
   * 마지막 값을 반환하면서 마지막의 요소를 리스트에서 제거
   * index값을 사용할 경우 index 위치 요소값을 제거한다.
   * 더이상 제거할 값이 없으면 `Error` 발생

4. .extend(list_type)
   
   * 리스트 확장
   
   ```python
   list = [1, 2, 3]
   list2 = [4, 5]
   list.extend(list2)
   # 라고 한다면 list가 확장된다
   # => list == [1, 2, 3, 4, 5]
   ```

5. 리스트 정렬
   
   * .sort([key=str.lower], [reverse=True])
   * .reverse()
     * 리스트 순서를 역순으로 변경
   * sorted(list_type)
     * 정렬된 결과를 return
     * 원본 리스트를 변경하지 않음

6. 최소값 / 최대값
   
   * max(list_type)
     * 최대값 반환
   * min(list_type)
     * 최소값 반환

7. .index(value)
   
   * 찾는 값의 위치 index return
   * 찾는 값이 없는경우 `Error`발생

8. in / not in

9. 리스트 일치 검사
   
   * `==, !=, >, <`
   * index가 낮은 것부터 비교 해서 참이 되면 멈추는것 같음
   * return 값 : bool(True, False)

10. .count(value)
    
    * 리스트 내의 특정한 요소의 갯수 세기
    * 찾는 값이 없으면 `0`return

11. map(type, value)
    
    * 집합형 데이터 value를 type으로 하나하나씩 변환한다.
    * map함수로 반환된다
    * list(map(type, value))으로 하면 list로 변환된다.



#### 2차원 리스트

* 리스트의 원소로 리스트를 가지고 있는 형태

```python
list = [[1,2,3], [4,5,6], [7,8,9]]
```

* 위와 같은형태이다.
* list[1][0\]과 같은 형태로 접근할 수 있다.



- [리스트 예제1](https://github.com/JungMJ322/Python/blob/main/example/10_list_ex1.py)
- [리스트 예제2](https://github.com/JungMJ322/Python/blob/main/example/11_list_ex2.py)

---





### 튜플

> 리스트와 비슷함
> 
> 리스트는 원소의 변경이 가능한 반번 튜플은 원소를 변경할 수 없다

* 원소 추가, 삭제, 변경 불가

```python
tuple_ex = (1, 2, 3)
tuple_ex2 = tuple(1, 2, 3)
```

* 리스트와 비슷한 매소드들 사용가능
  
  * .index(), .count() 등등

* 튜플을 변경할 경우 튜플을 리스트로 변환한 뒤 다시 튜플로 변환한다.
  
  ```python
  myTuple = 10, 20, 30
  list_myTuple = list(myTuple)
  list_myTuple.append(40)
  myTuple = tuple(list_myTuple)
  print(myTuple)
  ```

---





### 딕셔너리

* Dictionary
  * 키와 값의 쌍으로 이루어진 데이터

```python
dict1 = { key1: value1, key2: value2, ...}
dict1 = dict()
```

* .keys()
  * 딕셔너리의 키값을 반환한다
  * reutn 값 dict_keys
* .value()
  * 딕셔너리의 각각의 값을 반환한다
  * return 값 dict_values



- [딕셔너리 예제1](https://github.com/JungMJ322/Python/blob/main/example/12_dict_ex1.py)
- [딕셔너리 예제2](https://github.com/JungMJ322/Python/blob/main/example/13_dict_ex2.py)

---





### Set

> 집합 형태의 자료구조(집합 자료형)

```python
# set 생성
s1 = {1, 2, 3, 4, 5}
s2 = set([3, 4, 7, 8, 9])
s3 = set()
```

* 중복을 허용하지 않는다
  
  * unhashable type

* 입력순서와 출력되는 순서가 다를 수 있다.

* 인덱스 사용이 불가능하다
  
  * 이미 포함되어 있는 요소를 변경할 수 없다.

* set 요소 추가
  
  * 1개 추가
    
    * .add()
    
    ```python
    s4.add(10)
    ```
  
  * 여러개 추가
    
    * .update()
    
    ```python
    s4.update([5, 6])
    ```

* 집합 안에 변경가능한 항목 포함 불가능
  
  * 리스트 포함 불가
  * 튜플은 포함 가능

* 요소 삭제 기능
  
  * .remove()



#### Set의 연산

1. 교집합
   
   ```python
   C = A & B
   C = A.intersection(B)
   ```

2. 합집합
   
   ```python
   C = A | B
   C = A.union(B)
   ```

3. 차집합
   
   ```python
   C = A - B
   C = A.difference(B)
   ```

---





## 함수

> function
> 
> 반복되는 코드를 함수로 정의하여 필요할 때마다 불러서 사용할수 있도록
> 
> => 여러줄 쓸것을 함수하나로 해결하도록

```python
# 함수(function) 정의 및 호출

# 함수 정의
def 함수명([매개변수1, 매개변수2, ...]):
    내용
    ...
    [return 반환값]

# 함수 호출
함수명()
함수명(인수1, 인수2, ...)        # 함수인수를 위치기반 전달

# 함수의 매개변수들
# 디폴트 매개변수 : 앞쪽에 올 수 없다
def 함수이름(매개변수1, 매개변수2=값, ....]):
    pass

함수이름(인수1, 인수2)
함수이름(인수1)                # 이경우 인수2는 입력 안했기 때문에 매개변수2의
                            # 디폴트 값으로 매개변수가 된다.
```

* 가변길이 매개변수
  * 함수 호출할 때 인수의 개수를 사용자가 마음대로 정할 수 있다.
  * `*args`
    * 리스트의 형태로 함수에 전달
    * 함수명(인수1, 인수2, ...)
  * `**kwargs`
    * 딕셔너리의 형태로 함수에 전달
    * 함수명(인수1 = 값1, 인수2 = 값2, ...)
* return
  * 함수에서 연산된 값을 반환
  * return 값1, 값2, 값3
    * 이런 경우 튜플의 형태로 반환한다.
* 지역변수
  * 함수 내부에서만 사용되는 변수
  * 함수 종료 후 사라진다
  * 같은 이름의 전역변수가 있는경우 지역변수가 우선된다.
* 전역변수
  * 함수 밖에서 선언된 변수
  * 함수 내부에서 사용할 경우 `global`키워드를 사용한다.



### Lambda 함수

* 한줄로 만들수 있는 함수를 간단하게 작성
* 변수 = lambda 매개변수들 : 식

```python
# 함수 원형
def add(x, y):
    result = x+y
    return result

# 람다 함수
add2 = lambda x,y : x+y
```

* lambda 함수 & map()

```python
# list1의 각각의 요소들을 람다함수로 계산하여 맵핑한뒤 list로 만들어 num1에 선언한다.
# list1의 각각의 요소들에 10씩 더함
num1 = list(map(lambda num: num+10, list1))
```



- [함수 예제](https://github.com/JungMJ322/Python/blob/main/example/14_function_ex1.py)

---





## 모듈

* 모듈의 전체 참조
  
  * import 모듈명

* as 별칭
  
  * import 모듈명 as 별칭
  * 모듈명이 길거나 모듈명이 동일한 경우 별칭으로 사용

* 모듈 내 함수를 참조
  
  ```python
  import 모듈
  
  #함수 참조
  모듈.함수명()
  ```

* 모듈 내에서 일부만 참조
  
  * from 모듈명 import 변수명 or 함수명
  * from 모듈명 import *
  * from 모듈명 import 변수명 or 함수명 as 별칭

---





## 패키지

> Package
> 
> 패키지는 디렉토리 안에 `__init__.py` 파일 존재
> 
> 이는 일반디렉토리와 패키지와의 다른점이다.

* 모듈들을 모아놓는 디렉토리(폴더)

* 패키지를 사용할 경우 모듈 import
  
  ```python
  import 패키지.모듈
  import 패키지.모듈 as 별칭
  from 패키지.모듈 import 함수
  from 패키지.모듈 import **
  ```

* `.` 으로 현재의 디렉토리를 나타내고

* `..`으로 상위 디렉토리를 나타낸다.

---





## 파일

> 파일을 읽거나, 파일에 데이터를 쓰는과정

* 파일 생성

```python
f = open('file.txt', 'w')
f. close
f = open('C:/python/file.txt', 'w')
f.close
```

* 존재하지 않는 디렉토리 경로일 경우 에러 발생



### 파일에 쓰기

```python
f = open('파일이름', 'w'[, encoding='파일형식'])
f.write('내용')       # 파일에 내용 쓰기
f.close()
```

* 파일 형식 부분에는 UTF-8, ANSI등 인코딩이 들어간다.



### 파일 읽기

1. readline()
   
   * 한줄 씩 읽어오기
   
   ```python
   # 첫번째 라인 1개 읽기
   f = open('test.txt', 'r')
   line = f.readline()     
   print(line)
   f.close()
   
   # 한줄씩 끝까지 읽어오기
   f = open('test.txt', 'r')
   while True:
       line = f.readline()
       if not line:
           break
       print(line, end='')        # 한줄씩 출력된다.
   f.close()
   ```
   
   * 문자열의 형태로 읽어온다

2. readlines()
   
   * 전체 라인 읽어오기
   
   ```python
    f = open('test.txt','r')
   lines = f.readlines()
   print(lines)
   f.close()
   ```
   
   * 리스트의 형태로 읽어온다.
     * 한 줄이 리스트의 요소가 된다.

3. seek()
   
   * seek(Offset, Whence)
     * Offset 상대위치, 시작 위치로부터 열의 위치
       * byte 단위로 상대적 위치를 정한다
     * Whence 위치
       * 0 파일시작위치, 1 현재위치, 2파일의 끝
   * 한줄 끝에 `\r\n` 있기때문에 이 문자도 위치에 포함된다.

4. read()
   
   * 파일 읽기
   
   * 파일 내용 전체를 읽어서 1개의 문자열로 반환
* open('파일이름', '모드'[, 인코딩])
  
  > 여기서 모드가 무엇이냐에 따라 파일 읽기인지 파일 쓰기 인지 달라진다.
  
  * Write => w
  * Read => r
  * Append => a

* append mode
  
  * `'a'`
  
  * 파일 끝에 추가
    
    > 파일 내용 끝에 입력한 내용을 추가시키니다.



### with 문

> with문이 종료되면 파일객체는 자동으로 close

```python
with open('파일명', '열기모드') as 파일객체:
    수행코드
```



### 디렉토리

* import os, shutil

* 위의 2개를 import하여 디렉토리 생성 삭제를 한다.
  
  ```py
  import os, shutil
  # 생성
  os.mkdir('디렉토리이름')
  # 삭제
  shutil.rmtree('디렉토리이름')
  ```

* mkdir은 생성하려는 디렉토리의 이름이 이미 있다면 `Error`발생한다.

* rmtree는 삭제하려는 디렉토리의 이름이 없으면 `Error`발생 한다.

* 그래서 디렉토리가 있는지 확인하는 isdir()함수를 사용한다.
  
  ```py
  import os
  # return값 bool
  if not os.path.isdir('디렉토리 이름'):
      os.mkdir
  ```

* 하위 디렉토리와 파일을 보여줌
  
  ```python
  import os
  for dirName, subDir, fnames in os.walk('d:/Python_Ex/PythonStudy/08_22_0103'):
      print(dirName)
      for fname in fnames:
          print(fname)
  ```

* 디렉토리 존재 유무 확인
  
  ```python
  import os.path
  # os.path.exists('파일경로')
  print(os.path.exists('c:/pythonStudy'))
  print(os.path.exists('c:/pythonStudy/test.py'))
  ```

* 파일 삭제
  
  ```python
  import os
  os.remove('파일경로')
  ```



### 이진파일

* Binaryh File

* 글자가 아닌 비트 단위로 의미가 있는 파일

* 그림파일, 음악파일, 동영상파일, 엑셀파일, 한글파일, 실행 파일 등

* open함수 '파일모드' 방식이 달라진다.
  
  ```python
  #이진파일 읽기
  open('이진파일이름','rb')
  read(1)            # 1byte씩 읽기
  # 이진파일 쓰기
  open('이진파일이름','wb')
  write()
  ```



### Error

* ZeroDivisionError
  * 0으로 나눈 경우
* TypeError
  * 자료형이 맞지 않는 경우
* NameError
  * 정의 되지 않은 이름
* ValueError
  * 불완전한 형식
* SyntaxError
  * 문법적 오류
* IndexError
  * 인덱스 길이와 맞지않을 경우
* UnboundLocalError
  * 지역변수가 함수나 class내에 선언되지 않은 경우
* ModuleNotFoundError
  * 모듈의 이름을 찾을수 없는 경우
* FileNotFoundError
  * 파일을 찾을수 없는 경우
* OSError



### Exception

* 에러 종류와 상관없이 에러가 발생하면 처리한다

```python
try:
    에러가 발생할 문장
    ...
except [에외처리 클래스 as e(변수)]:
    [특정]에러가 발생하면 처리하는 문장들
else:
    에러가 발생하지 ㅇ낳으면 처리하는 문장
finally:
    에러와 상관없이 항상 수행하는 문장
```

---





## 객체지향 프로그래밍

> Object Oriented Programming

* 함수처럼 어떤 기능을 함수 코드에 묶어두지 않고 객체에 기능을 정의하는것

* 함수와 변수를 함계 가지고 있도록 구성

* 코드의 재사용성
  
  | 단어             | 내용                                                                         |
  | -------------- | -------------------------------------------------------------------------- |
  | 객체             | 함수(function) + 데이터(변수)                                                     |
  | 클래스(class)     | 객체를 만들어내는 틀<br>객체가 가지는 기본 정보를 담은 코드<br>**메소드(함수) + 필드(변수)** => 클래스의 **속성** |
  | 인스턴스(instance) | 클래스로부터 생성된 객체<br>실제로 생성되는 객체                                               |



### 클래스 구현 과정

1. 클래스 정의(선언)

```python
class 클래스명:
    필드1 = 0
    필드2 = ''
    def __init__(self):         # 생성자
        self.필드명1 = 초기값
        self.필드명2 = 초기값
        ...

    def 메소드명1(self, 매개변수, ...):
        pass

    def ...:
        ...
    # 메소드 정의는 함수를 정의하는 것과 동일
```

2. 객체생성(인스턴스 생성)
   
   * 변수 선언과 비슷하다
   
   ```python
   객체변수명 = 클래스명()
   ```

3. 객체이용, 메소드호출, 필드값 변경, 필드값 사용
   
   * 변수나 함수와 다르게 객체를 구별한다
   
   ```python
   객체변수명.필드명1
   객체변수명.메소드명1()    # 메소드 호출
   
   # 특정한 클래스의 인스턴스인지 확인
   isinstance(객체변수명, 클래스명)
   ```
   
   

### 비공개 필드와 메소드 생성

1. 비공개 필드
   
   - 필드를 외부에서 직접사용하지 못하도록 하는 방법
   
   - 클래스 내부에서만 사용가능
   
   - 이에 접근할 시 간접적으로 사용해야 한다
     
     - 클래스의 내장 매소드를 이용
   
   - `__필드명`

2. 비공개 매소드
   
   - 외부에서 직접 사용하지 못하고 클래스 내부에서만 접근
   
   - `def __메소드명(self, *args*)`

```python
class Car:
    def __init__(self, modelN, speed=0, color='white'):
        self.modelN = modelN
        self.speed = speed

        # 클래스 내에서만 사용하는 비공개필드
        self.__color = color  

        # 클래스 내에서만 사용하는 비공개 매소드
        def __modelN(self):
            print(self.modelN)
		
        # 비공개 필드에 접근하는 매소드
        def getColor(self):
             return self.__color
        
        # 비공개 매소드(__modelN())에 접근하는 메소드
        def printInfo(self):
            self.__modelN()
            print(self.getColor())
            
# 비공개 필드를 접근하려면 필드를 이용하는 메소드를 정의하여 호출
car1 = Car()
# print(car1.color)  =>  사용불가
print(car1.getColor())
car1.printInfo()
```

* 비공개 필드에 접근하려면 필드를 이용하는 메소드를 정의 하여 호출한다.
* 위와 같이 비공개 필드인 `color`에 접근할수 없어 `getColor`메소드로 접근해야 한다.



### 특별한 메서드

* __매서드이름__()
  
  * 미리 정의되어있는 메서드

| 메서드      | 내용                        |
| ----------- | --------------------------- |
| \__ge__()   | >=                          |
| \__gt__()   | >                           |
| \__lt__()   | <                           |
| \__le__()   | <=                          |
| \__ne__()   | !=                          |
| \__eq__()   | ==                          |
| \__init__() | 생성자                      |
| \__repr__() | 인스턴스 print()문으로 출력 |
| \__add__()  | +                           |
| \__sub__()  | _                           |
| \__mul__()  | *                           |
| \__del__()  | 소멸자, 인스턴스를 삭제     |



### 클래스 상속

- 상속(inheritance)
- 부모클래스(super class) : 상속을 해주는 클래스
- 자식클래스(sub class) : 상속을 받는 클래스
- `class 자식클래스(부모클래스):` 의 형태로 클래스 상속한다.



#### 다중 상속

- 여러클래스에서 상속을 받음
- `class 클래스이름(부모클래스1, 부모클래스2, ...):`

```python
class 부모클래스1:
    def __init__(self):
        pass
    
class 부모클래스2:
    def __init__(self):
        pass
    
class 클래스이름(부모클래스1, 부모클래스2):
    pass
```



#### 정적 메서드

> Static Method

- 인스턴스를 통하지 않고 클래스에서 바로 호출하여 사용

- 메서드 위체 `@staticmethod`를 붙임

- 메서드에 self를 넣지 않아도 된다

- 정적 메서드 호출

  - `클래스이름.정적메서드(*arg)`

  ```python
  class Calc:
      @staticmethod
      def add(a, b):
          return a+b
      
      @staticmethod
      def mul(a, b):
          return a*b
      
  # 인스턴스 변수를 생성하여 만들 수 있음
  Calc1 = Calc()
  print(calc1.add(3,2))	# 5
  
  # 인스턴스 변수 생성없이 클래스 이름으로 메서드 호출하여 사용할 수 있음
  # 정적메서드 호출
  print(Calc.add(10,30))	# 40
  ```

  

#### 클래스 메서드

- 인스턴스를 통하지 않고 메서드를 클래스에서 바로 호출

- 메서드 내에서 클래스 변수, 클래스 메서드를 접근할 때 사용

- `@classmethod`를 메서드 위에 붙인다

  - 메서드내에 인수로 `cls`를 지정
  - cls - class

  ```python
  # 형식
  class 클래스이름:
      @classmethod
      def 메서드명(cls, 매개변수들):
          문장들
  
  # 호출 형식
  클래스이름.메서드명(인수들)
  ```

  ```python
  class Person:
      count = 0           	# 클래스 속성
      def __init__(self, name):
          self.name = name
          Person.count += 1	# 인스턴스가 만들어질 때 카운트
  
      # cls로 클래스 속성에 접근
      @classmethod
      def printCount(cls):
          print(f'{cls.count}명이 태어났습니다.')
  
  man1 = Person('Kim')
  man2 = Person('Lee')
  Person.printCount()     	# 2명이 태어났습니다.
  ```

  

