# django

```
projectName
|-- manage.py
`-- projectName
	|-- asgi.py
	|-- settings.py
	|-- urls.py
	`-- wsgi.py
```



#### manage.py

> project 관리

**project**

- 생성

  - startapp

  ```django
  django-admin startproject projectName
  ```

  - 프로젝트를 생성하면 그 프로젝트 안에 프로젝트 이름과 동일한 app이 생성된다.

- 실행

  - runserver

  ```django
  python manage.py runserver
  
  # http://127.0.0.1:8000/
  ```

- app 생성

  ```django
  python manage.py startapp mysite
  ```

  - app을 생성하면 프로젝트 안에 하위 폴더로 생성된다.

- Migration

  -  models.py에 정의된 **모델의 생성/변경 내역을 히스토리 관리**, **데이터베이스에 적용** 등과 같은 기능을 제공
  - 쉽게 데이터베이스의 구조를 변경할수 있도록 한다

  ```django
  # 파일 생성
  python manage.py makemigrations app-name
  
  # 적용
  python manage.py migrate [app-name]
  ```

  

#### wsgi.py

> Web Server Gateway Interface

* WebServer
  * 정적
  * client에서 구현해 server에 요청하면 구현한 대로 응답해준다.
* WAS
  * Web Application Server
  * 동적
  * client에서 server에 요청하면 server에서 구현하여 응답해준다.
* 위의 2가지 통신 지원
* 요세는 asgi로 대체된다.



#### asgi.py

> Asynchronous Server Gateway Interface

* WebServer, WAS의 동기/비동기 통신 지원(django 3.0이상)



#### setting.py

> project의 환경 설정

* INSTALLED_APPS
  * 사용할 기능들 목록
* TEMPLATES
  * DIRS
    * templates의 기본 경로를 지정할 수 있다.
* DATABASES
* STATIC_URL
  * static의 위치 지정할 수 있다.



#### urls.py

> URLConf (URL Configuration)

* url <===> function mapping

* 요청에 맞는 작업 호출

  ```python
  from django.contrib import admin
  from django.urls import path, include
  from . import views
  
  urlpatterns = [
      path('admin/', admin.site.urls),
      path('', views.index),
      path('var/', include('var.urls')),
      path('statics/', include('statics.urls')),
  ]
  ```

* path를 사용하여 특정요청(`'요청'`)을 요청할 때 작업을 호출 하도록 한다.



#### view.py

* urls.py에서 작업을 호출하도록 요청받으면 때

* 그 데이터를 처리

* 필요하다면 model.py에 요청해 DB data를 가지고 온다.

  ``` python
  from django.shortcuts import render
  
  def index(request):
      return render(request, 'index.html', {'name': 'Jaejung'})
  ```

* 함수의 형태로 return `render`를 통해 구현할 것을 server에 요청한다.



### MVT

> Model / View / Template

- Model
  - DataBase 연동(DB또한 별도의서버)
    - mySQL을 통해 서버를 만들어 요청/응답한다
  - 필요하다면 DB에 연결해 구현한다.
  - python으로 SQL 명령어를 몰라도 DB를 조작할 수 있도록 한다.
- View
  - Data 구성
  - Server에 어떻게 요청할 것인지 구성한다.
  - => 함수를 통해
  - render 구현시킴
- Template
  - Data 표현
  - html 등을 이용해 어떻게 표현할 것인지 요청한다.



1. Server에 연결해 `Web Sever`에 입장
2. `wsgi.py`를 통해 요청
3. `urls.py`를 통해 요청에 따른 함수를 `view.py`에서 호출
4. 호출된 함수에 DB관련 작업이 있다면 `models.py`를 통해 DataBase와 연동해 값을 가지고 옴
5. 호출된 함수에서 `render()`를 통해 구현할 TEMPLATE(`.html`)을 응답
6. wsgi.py를 통해 Template 응답받은 것을 Wep Server로
7. Wep Server에서 다시 client로 응답





- CSR
  - Client Side Rendering
  - FrontEnd
  - client <==> Web Server
  - 서버에 데이터만 요청하고, js로 view를 컨트롤

- SSR
  - Sever Side Rendering
  - BackEnd
  - wsgi.py를 통해 서버에 요청/응답 받는 방식
  - 페이지를 이동할 때마다 서버에 새로운 페이지에 대한 요청을 한다



client 요청 => web server => urls => views => [models] => template => web server => client 응답

----------





**onclick**

- Tag 옵션들중 onclick에 경로를 직접 넣을 때
- `location.href='경로'`로 경로를 넣어야 동작한다.

```html
<!-- html -->
<td><a href="detail/{{ data.id }}">{{ data.mytitle }}</a></td
```

- 경로안에 {{ data.id }}의 형태로 변수 값을 요청할 수 도 있다.


```python
# urls
path('detail/<int:id>', views.detail, name='detail'),
```

- 요청이 변수 값이라면 urls.py에 < type : varialbe >


```python
# views
def detail(request, id):
    return render(request, 'detail.html', {'dto': MyBoard.objects.get(id=id)})
```

- 요청을 처리할 때 views.py에서 값을 줄때는 dict의 형태로 보낸다.

---------



#### shortcuts

**render()**

 ``` django
 render(request, template_name, context=None, content_type=None, status=None, using=None)
 ```

- 주어진 template와 dict 내용을 결합하여 랜더링된 텍스트와 함계`HttpResonse` 객체를 반환한다.



**redirect()**

```django
redirect(to, *args, permanent=False, **kwargs)

redirect('urls-name')
```

- 전달된 인수에 대한 적절한 URL에 대한 HttpResponseRedirect를 반환

---------------------------------------------------------------------





**filters**

```django
# filters
{{ request.session.myname | default:"Django" }}
```

- 변수나 태그 인수(tag arguments)를 변수로 변환한다.
- request.session.myname의 default(기본값)을 Django로 변환한다.



```
{% url 'detail' data.id %}
이렇게 사용하려고 하면

urls.py path에 name='detail'이 있어야 한다.
```

---





1. django-admin startproject pro-name
2. pro-name-app 에 models.py 생성
3. setting.py 설정
4. python manage.py makemigration app-name
5. python manage.py migrate app-name
6. templates 생성
7. views 생성 추가
8. urls에 path추가
9. python manage.py runserver



#### Paginator

> 페이지가 매겨진 데이터, 이전/다음 링크가 있는 여러 페이지로 분할된 데이터를 관리하는데 도움
>
> 개시글이 일정 개수이상되면 맨밑에 처음/이전/숫자/다음/끝 이런식으로 화면을 볼수 있게 만들어 놓은 것

1. ?page={{}}
   - 주소창을 보면 localhost/?page=1 의 형식으로 되어있는 것을 확인 할 수 있다.
   - Paginator 모듈에서 주소를 자동으로 저렇게 잡아 주는 듯?

2. has_previous()
   - 이전 페이지가 있다면 True 반환

3. has_next()
   - 다음 페이지가 있다면 True 반환

4. Page.previous_page_number()
   
   - 이전 페이지 번호 반환, 없으면 잘못된 페이지 반환
   
5. Page.next_page_number()
   
   - 다음 페이지 번호 반환. 없으면 잘못된 페이지 반환
   
6. Paginator.page_range
   
   - 페이지 번호의 1부터 시작하는 범위 반복기, 페이지의 길이만큼 1부터 끝번호 까지 list 생성 예) [1, 2, 3, 4]
   - 페이지 개수대로 1부터 1씩 징가하는 list
   
7. Page.number
   
   - 이 기본이되는 현제 페이지 숫자

   - 현제 있는 페이지 숫자 반환해 주는거 같음 
   
8. paginator.num_pages
   
   - 총 페이지 수

   - 페이지가 1부터 5까지 있다고 하면 총 페이지 개수 5개 / 페이지의 끝번호도 5
   
9. Page.count
   
   - 모든 페이지 객체의 수
   
10. Page.start_index()
    
    - 페이지네이터(DB에 저장된 data들 ? ) 목록에 있는 모든 객체들의 index 기준으로, 현제 페이지에 있는 첫 번째 객체의 index(모든 객체들의 index)를 반환
    
    ```
    paginator 안에
    pageObject1 pageObject2 pageObject3 pageObject4 pageObject5 가 있다고 하고
    페이지별 객체 2개씩 있다고 하면
    pageObject1 pageObject2		=>	1page
    pageObject3 pageObject4		=>	2page
    pageObject5					=>	3page
    에서 2page에 start_index()라고 하면
    3이 반환됨
    ```

11. Page.end_index()

    - start_index()의 end버전

    - 페이지네이터 목록에 있는 모든 객체들의 index 기준으로, 현제 페이지에 있는 마지막 번째 객체의 index를 반환



### example

- 로그인,회원가입,팝업창
- Ajax
- post방식,get방식
- 공용API활용
- 파일 업로드,다운로드
- DB연결
- 등등,장고 학습로그
