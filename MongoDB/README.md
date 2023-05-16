# MongoDB

- 고정되지 않은 스키마
  - 필요할 때 마다 필드 추가
  - 제거 -> 개발 속도 향상

- 데이터 간의 관계를 정의하지 않는 데이터베이스
  - db => collection => document
  
- 분산형 구조
  - 대용량 데이터 저장 용이
  - sharding 지원
  - 클러스터 데이터 상호 복제
  



## Data Structure

- database
  - 독립적인 하나의 권한
  - 각각의 dtabase는 분리된 파일로 저장
  - sql의 db
- collection
  - document들의 group
    - 관계형 db의 table
  - schema를 가지지 않음
    - document들의 field가 각각 다르다
  - sql의 entity
- documnet
  - data record를 BSON으로 저장
    - Binary JSON
  - field(key) 중복 불가
  - sql의 attribute와 tuple
  - field는 sql의 attribute



## CRUD

> Create, Read, Update, Delete

- db, collection은 임의의 db명, collection명



### Create

- collection에 document생성

- insertOne

  - document 하나만 생성

- insertMany

  - document 여러개 생성

- ```js
  // _id(primary key)를 명시하지 않으면 자동으로 ObjectId 생성
  db.collection.insertOne(
  document
  )
  
  // documnet 다중 생성
  db.collection.insertMany(
  	[
  		document,
  		document,
  		...
  	]
  )
  ```

- ```js
  // 예제
  // student라는 collection생성
  db.student.insertMany(
  	 [
       	{name:'kim_sd', class:'ds', kor:100, eng:40, math:100},
  	 	{name:'kang-hd', class:'ds', kor:88, eng:50, math:70}
  	 ]
  )
  
  // insertMany는 _id가 여러개 생성된다
  // 밑의 형식처럼
  {
          "acknowledged" : true,
          "insertedIds" : [
                  ObjectId("6229478d5d8fc93b1d7e0587"),
                  ObjectId("6229478d5d8fc93b1d7e0588")
          ]
  }
  ```



### Read

- collection의 document 읽기

- find

- ```js
  // collection의 document 읽기
  db.collection.find(query, projection)
  
  // find의 결과를 cursor에 저장할수 있음
  var cursor = db.collection.find()
  ```

- ```js
  //예제
  var cursor = db.student.find()
  // 1번 사용하면 collection의 내용들을 cursor에 저장 했다가 호출하면 보여줌
  // cursor라고 2번째 사용한다면 아무것도 뜨지 않음
  
  db.student.find()
  // student collection의 모든 도큐먼트를 확인
  db.student.find({}) 					//이것도 됨
  db.student.find({}, {name:1})			//_id와 name만
  db.student.find({}, {_id:0, name:1}) 	// name만
  db.student.find({}, {_id:0, name:true, midterm:1}) 	//없는 feild라면 생략, 없으면 없는데로 출력 처음의{}는 조건
  
  db.student.find({class:'ds'}) 			// 특정 feild:value인 값을 찾음
  
  db.student.find({'midterm.kor':{$gt:50}})
  // midterm의 kor가 50보다 큰 collecter를 가지고옴($gt ==> >(크다, great then))
  
  // 국어점수가 존재하는 도큐먼트 출력
  db.student.find({kor:{$exists:true}})
  
  //국어점수가 50점보다 크고, 100점보다 작은
  db.student.find({$and:[{kor:{$gt:50}}, {kor:{$lt:100}}]})
  db.student.find({kor:{$gt:50}, kor:{$lt:100}})
  db.student.find({kor:{$gt:50, $lt:100}})
  //국어점수가 50점보다 크거나 같고, 100점보다 작거나 같은
  db.student.find({$and:[{kor:{$gte:50}}, {kor:{$lte:100}}]})
  db.student.find({kor:{$gte:50}, kor:{$lte:100}})
  db.student.find({kor:{$gte:50, $lte:100}})
  
  // 정렬 (1:asc, -1:desc)
  db.student.find().sort({name:1})
  
  // 제한 (내림차순으로 정렬된것중 가장 위에 1개)
  db.student.find().sort({kor:1}).limit(1)
  
  // 맨처음 하나 생략
  db.student.find().skip(1)
  ```



### Update

- collection의 document 수정

- update

  - updateOne
    - document의 field 하나만 수정
  - updateMany
    - document의 field 여러개 수정
  - filter
    - 수정할 document를 find

  - update
    - find한 document를 어떻게 수정할 것인지

- replace

  - replaceOne
  - document 한개만 수정

- ```js
  // collection의 document의 field를 한개 수정
  db.collection.updateOne(filter, update, options)
  
  // collection의 document의 field를 여러개 수정
  db.collection.updateMany(filter, update, options)
  
  // collection의 document를 수정
  db.collection.replaceOne(filter, update, options)
  ```

- ```js
  // kim_sd가 홍길동으로 변경됨
  db.student.updateOne({name:'kim_sd'},{$set:{name:'홍길동'}})
  
  // matchedCound filter가 찾은 데이터 개수
  // modifiedCount 변경된 데이터 개수
  { "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
  
  // kor 점수가 있는 모든 학생들의 class를 'graduated'로 변경
  db.student.updateMany({kor:{$exists:1}}, {$set:{class:'graduated'}})
  
  // name이 있는 항목을 찾아서 document를 {class:'job'}로 변경
  db.student.replaceOne({name:{$exists:true}}, {class:'job'})
  // student의 첫번째 document가 name이 있다면
  // 기존의 {"_id" : ObjectId("id번호"), "name":'kim_sd', "class":'ds', "kor":100, "eng":40, "math":100}에서
  // { "_id" : ObjectId("id번호"), "class" : "job" }의형태로 변경됨
  
  //국어점수가 60점보다 적거나 같은 도큐먼트들을 찾아서
  //국어점수를 0점으로 만드는 자바스크립트 함수를 만들어 보자
  //함수 이름은 updateKor()
  //업데이트 된 결과를 리턴
  function updateKor(){
  	 var tmp = db.student.updateMany({kor:{$lte:60}}, {$set:{kor:0}})	
       return tmp
   }
  ```



### Delete

- collection의 document 삭제

- deleteOne

  - document 하나만 삭제

- deleteMany

  - document 여러개 삭제

- ```js
  // filter - 삭제할 document를 찾는다 / 삭제할 조건
  // collection에서 조건에 맞는 document 하나만 삭제
  db.collection.deleteOne(filter, options)
  
  // collection에서 조건에 맞는 document 여러개 삭제
  db.collection.deleteMany(filter, options)
  ```

- ```js
  // 이름이 '홍길동'인 도큐먼트 삭제
  db.student.deleteOne({name:'홍길동'})
  // class field가 존재하는 도큐먼트들을 모두 삭제
  db.student.deleteMany({class:{$exists:1}})
  ```



## Aggregation

- collection이 각 stage를 거치면서 document 처리 및 집계

- ```js
  // 이와 같은 형태
  // status가 A인 것들을 찾는다. 그 후, cust_id를 그룹화 하고 각 그룹의 amount 필드의 합계를 계산
  db.orders.aggregate([
      {$match: {status: "A"}},
      {$group: {_id: "$cust_id", total: {$sum: "$amount"}}}
  ])
  ```
  
- | sql      | nosql    |
  | -------- | -------- |
  | WHERE    | $match   |
  | HAVING   | $match   |
  | GROUP BY | $group   |
  | SELECT   | $project |
  | ORDER BY | $sort    |
  | LIMIT    | $limit   |
  | SUM      | $sum     |
  | COUNT    | $sum     |

- ```js
  // 예제
  db.score.insertMany([
     {name:"홍길동",kor:90,eng:80,math:98,test:"midterm"},
     {name:"이순신",kor:100,eng:100,math:76,test:"final"},
     {name:"김선달",kor:80,eng:55,math:67,test :"midterm"},
     {name:"강호동",kor:70,eng:69,math:89,test:"midterm"},   
     {name:"유재석",kor:60,eng:80,math:78,test:"final"},
     {name:"신동엽",kor:100,eng:69,math:89,test:"midterm"},
     {name:"조세호",kor:75,eng:100,math:100,test:"final"}
  ])
  
  // _id는 표기하지 않고 name, kor, eng, math는 표기
  db.score.aggregate(
  	{$project: {_id:0, name:1, kor:1, eng:1, math:1}}
  )
  
  // kor의 값이 80보다 큰 document를 찾는다
  db.score.aggregate(
  	{$match: {kor: {$gt:80}}}
  )
  
  // test field를 그룹화 하여 각각의 kor의 평균을 구함
  db.score.aggregate(
      // test field 사용
  	{$group: {_id:'$test', 'average':{$avg:'$kor'}}}
  )
  ```



## Mapreduce

- aggregation framework가 처리하지 못하는 복잡한 집계 작업에 사용

- javascript의 function을 사용하여 복잡한 작업 처리

- ```js
  // test가 final인 doc들의 이름, 국어, 영어 출력하고 '국어와 영의 합' 도 같이 출력
  function myMap(){
      emit(this.score, {name: this.name, kor: this.kor, eng:this.eng, test: this.test});	// 값을 가지고 올수 있음
  }
  
  // document의 field의 값을 배열로 만듬
  function myReduce(key, values){
      var result = {name: new Array(), kor: new Array(), eng: new Array(), total:new Array()}
      values.forEach(function(val){
          // field가 'final'인 경우
          if(val.test == 'final'){
              result.name += val.name + ' ';				// result.name 배열에 추가
              result.kor += val.kor + ' ';				// result.kor 배열에 추가
              result.eng += val.eng + ' ';				// result.eng 배열에 추가
              result.total += val.kor + val.eng + ' '		// result.total 배열에 kor + eng 한 값을 추가
          }
      });
      return result;
  }
  
  // 함수 myMap, myReduce를 사용하여 collection myRes으로 만든다
  db.score.mapReduce(myMap, myReduce, {out: {replace: 'myRes'}})
  db.myRes.find();
  // 결과 { "_id" : null, "value" : { "name" : "조세호 유재석 이순신 조세호 이순신 ", "kor" : "75 60 100 75 100 ", "eng" : "100 80 100 0 0 ", "total" : "175 140 200 75 100 " } }   
  ```



## pymongo

> python에서 mongodb에 접근할 수 있도록 하는 모듈

```python
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db = client['db name']
collection = db['collection name']
result = collection.find()
```



