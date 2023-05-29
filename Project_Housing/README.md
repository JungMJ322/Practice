# Project

## 주택 청약 경쟁률 예측 모델을 위한 데이터 셋 및 파이프라인 구축

> 문제해결을 위한 빅데이터활용 프로젝트
>
> 데이터를 수집 후 수집한 데이터를 활용하여 데이터 데시보드를 구현
>
> 데이터 파이프라인 구축



### 활용기술

- OS :  Ubuntu
- Language : Python
- DB :  MySQL, MongoDB
- Frontend : HTML, JS, JQ, CSS, Highcharts
- Backend : Apache Hadoop, Apache Spark
- DevOps :  AWS EC2, Git
- Web :  Django



### 주요 기능

- python으로 데이터 1차 가공 후 Hadoop에 저장
- Hadoop에 저장된 데이터를 spark로 불러와 전처리 후 DB에 저장
- DB에 저장한 데이터 시각화 하여 django 프로젝트 생성
- AWS ubuntu 환경에서 위의 과정을 파이프라인 구축하고 배포



### 데이터 수집

- python 활용

  - 주택 청약 데이터, 청약 경쟁률, 주택매매가 데이터
   - 공공데이터
  

  - 인프라 데이터
     - 병원, 편의점, 공원, 학교, 대규모점포, 교통시설(버스정류장, 지하철역)
        -  편의점을 제외한 다른 인프라 데이터는 공공데이터
        -  편의점 데이터의 경우 python의 selenium 프레임워크를 사용하여 크롤링




### 데이터 저장

- 수집한 데이터를 로컬에서 hdfs 명령어를 사용하여 hadoop에 저장
- 처리된 데이터를 mysql에 저장



### 데이터 처리

- pyspark 활용
  - spark를 활용하여 결측치, 이상치를 제거
  - 주택 청약, 인프라 raw data에 위경도 열이 없는 경우 카카오 api를 통해 주소를 위경도로 변환하여 추가
  - spark를 통해 처리한 데이터 DB에 저장

- mySQL, mongoDB
  - pyspark로 전처리한 주택 청약 데이터, 청약 경쟁률, 주택매매가 데이터를 mySQL에 저장
  - pyspark로 전처리한 인프라 데이터를 mongoDB에 저장
  -  청약이 나온 매물기준으로 반경 1km내의 인프라 개수를 확인하는데 사용




### 데이터 배포

- django 프로젝트를 생성해 데이터 대시보드를 제작
- AWS를 통해 배포
- 도별 데이터 시각화
- 각 도의 시별 데이터 시각화



### 내가 한 일

- api로 데이터 수집
- 데이터 Hadoop에 저장
- spark를 통해 데이터 전처리 후 DB 저장
- DB에 저장된 데이터 불러오는 함수 views.py에서 제작
- shell script로 데이터 수집, 저장, 처리 과정 순차적으로 실행할 수 있도록 제작



**특이사항**

- 현제 폴더에는 내가 작성한 코드만 있음
- AWS EC2는 학원에서 프로젝트 기간 동안 지급받은 것으로 더 이상 접속할 수 없음
- DS팀과 함께한 통합 프로젝트
- [project_link](https://github.com/JungMJ322/Housing)
