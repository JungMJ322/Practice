# Project

## 서울 맛집 공유 플랫폼 서비스

> 기업요구사항 기반의 문제해결 (융합)프로젝트 
>
> 데이터를 수집 후 수집한 데이터를 활용하여 데이터 데시보드를 구현
>
> 데이터 파이프라인 구축



### 활용기술

- OS : Ubuntu
- Language : Python
- DB : MySQL, MongoDB
- Frontend : HTML, JS, JQ, CSS
- Backend : Apache Hadoop, Apache Spark, Apache Airflow, NGINX, Gunicorn, lasticsearch, Logstash
- DevOps : AWS EC2, Git
- Web : Django



### 주요 기능

- 서비스
  - python으로 데이터 1차 가공 후 Hadoop에 저장
  - Hadoop에 저장된 데이터를 spark로 불러와 전처리 후 DB에 저장
  - DB에 저장한 데이터 시각화 하여 django 프로젝트 생성
  - AWS ubuntu 환경에서 위의 과정을 파이프라인 구축하고 배포

- DE
  - Hadoop에 데이터 저장
  - 저장된 데이터 Spark 가공 후 DB에 저장
  - 사용자 위치 중심으로 1km내 음식점을 가까운 순서대로 추천
  - Elasticsearch를 활용하여 검색기능 구현
  - Airflow로 파이프라인 관리하면서 날씨 데이터의 지속적인 갱신 목표
  - AWS Ubuntu 환경에서 파이프라인을 구축하고 서버를 https로 배포




### 데이터 수집

- python 활용
  - 서울 음식점 데이터, 날씨 데이터
  -  서울 열린 데이터 광장, 공공데이터 포털

- 음식점 리뷰 데이터
  -  카카오맵, 다이닝코드
  -  python의 selenium 프레임워크를 사용하여 크롤링

- Logstash 활용
  - MySQL에 저장된 음식점 데이터를 동기화




### 데이터 저장

- 수집한 데이터를 로컬에서 hdfs 명령어를 사용하여 hadoop에 저장
- 처리된 데이터를 mysql, mongodb, elasticsearch에 저장



### 데이터 처리

- pyspark 활용
  - spark를 활용하여 결측치, 이상치를 제거

  - 음식점의 위경도가 없는 경우 주소를 위경도로 변환하여 추가

  - 리뷰 특수문자, 영어 제거





### 데이터 배포

- django 프로젝트를 생성해 서비스 페이지 제작
- gunicorn과 NGINX를 이용해 AWS를 통해 배포
- NGINX 설정으로 Https로 변경



### 내가 한 일

- AWS 환경 구축
  - AWS환경에서 python, pyspark, django, mysql, mongodb, logstash,   elasticsearch 환경 구축
  - gunicorn과 NGINX를 이용한 django 배포를 위한 환경 구축
  - NGINX 설정으로 https로 변경

- api로 데이터 수집
- 데이터 Hadoop에 저장
- spark를 통해 데이터 전처리 후 DB에 저장
- Logstash로 MySQL과 Elasticsearch동기화
- Elasticsearch를 활용하여 자동완성 기능 구현
- 지도 중심으로 반경 1km 이내 음식점 위치 마커생성 기능 구현



**특이사항**

- 현제 폴더에는 내가 작성한 코드만 있음
- AWS EC2는 학원에서 프로젝트 기간 동안 지급받은 것으로 더 이상 접속할 수 없음
- Logstash와 Elasticsearch 활용한 것을 정리한 [문서](https://github.com/JungMJ322/Practice/blob/master/Project_Taste/ElasticSearch.md)
- [project_link](https://github.com/codnjs3575/Final_Team04)

