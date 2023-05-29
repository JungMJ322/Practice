# ElasticSearch

> MySQL과 ElasticSearch를 연동하여 ElasticSearch를 통해 MySQL의 table 내용을 검색할 수 있도록 

```python
#=======================================
#            Elasticsearch 설치        =
#=======================================
# Download and install the public signing key:
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# install apt-transport-https:
sudo apt-get install apt-transport-https

# Save the repository definition to /etc/apt/sources.list.d/elastic-7.x.list:
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

# install elasticsearch
sudo apt-get update && sudo apt-get install elasticsearch

# 실행
sudo systemctl start elasticsearch.service

# 중단
sudo systemctl stop elasticsearch.service

# 실행확인방법
curl -X GET "localhost:9200/?pretty"



#=======================================
#             logstash 설치            =
#=======================================
# install logstash
sudo apt-get update && sudo apt-get install logstash

# stashing first event
# `Pipelines running` 이라고 뜨면 아무 글이나 치고 `enter`를 치면 message가 뜸. 종료는 ctrl-d 
sudo /usr/share/logstash/bin/logstash -e 'input { stdin { } } output { stdout {} }'


# 실행
sudo systemctl start logstash.service

# 중단
sudo systemctl stop logstash.service



#=======================================
#          mysql-connector 설치        =
#=======================================
# 검색
# mysql-connector-java 검색됨.
apt search mysql-connector-java

# install mysql-connector-java
# 설치하면 mysql-connector-java-8.0.25.jar 가 /usr/share/java 에 위치함.
sudo apt-get install mysql-connector-java


#=======================================
#    logstash-integration-jdbc 설치    =
#=======================================
# /usr/share/logstash
/usr/share/logstash/bin/logstash-plugin install logstash-integration-jdbc

# 설치확인
/usr/share/logstash/bin/logstash-plugin list | grep logstash-integration
#logstash-integration-jdbc
# ├── logstash-input-jdbc
# ├── logstash-filter-jdbc_streaming
# └── logstash-filter-jdbc_static


#=======================================
#            *.conf 파일 설정           =
#=======================================
# /usr/share/logstash에 임의의 logstash conf파일을 만듬
input {
    jdbc {
      jdbc_driver_library => "/usr/share/java/mysql-connector-java-8.0.26.jar"
      jdbc_driver_class => "com.mysql.cj.jdbc.Driver"
      jdbc_connection_string => "jdbc:mysql://localhost:3306/<db명>"
      jdbc_user => "<db 접근 user>"
      jdbc_password => "<db 접근 비밀번호>"
      jdbc_paging_enabled => true
      tracking_column => "unix_ts_in_secs"
      use_column_value => true
      tracking_column_type => "numeric"
      statement => "SELECT *, UNIX_TIMESTAMP(updatedAt) AS unix_ts_in_secs FROM posts WHERE (UNIX_TIMESTAMP(updatedAt) > :sql_last_value AND updatedAt < NOW()) ORDER BY updatedAt ASC"
      schedule => "*/5 * * * * *" # Query주기 설정
      last_run_metadata_path => "/usr/share/logstash/.logstash_jdbc_last_run"
    }
}

# 필터가 필요하다면 아래 설정
filter {
  mutate {
    copy => {"id" => "[@metadata][_id]"}
    remove_field => ["id", "@version", "unix_ts_in_secs"]
  }
}

# Elasticsearch로 output 설정
output {
  # stdout {}
  elasticsearch {
    hosts => "http://localhost:9200"
    index => "broccolisearch"
    document_id => "%{[@metadata][_id]}"
  }
}
------------------------------------------------------------------
input {
    jdbc {
      jdbc_driver_library => "/usr/share/java/mysql-connector-java-8.0.26.jar"
      jdbc_driver_class => "com.mysql.cj.jdbc.Driver"
      jdbc_connection_string => "jdbc:mysql://localhost:3306/test"
      jdbc_user => "root"
      jdbc_password => "1234"
      jdbc_paging_enabled => true
      tracking_column => "unix_ts_in_secs"
      use_column_value => true
      tracking_column_type => "numeric"
      statement => "SELECT *, UNIX_TIMESTAMP(modification_time) AS unix_ts_in_secs FROM inch WHERE (UNIX_TIMESTAMP(modification_time) > :sql_last_value AND modification_time < NOW()) ORDER BY modification_time ASC, id"
      schedule => "*/10 * * * * *" # Query주기 설정
      last_run_metadata_path => "/usr/share/logstash/.logstash_jdbc_last_run"
    }
}

# 필터가 필요하다면 아래 설정
filter {
  mutate {
    copy => {"id" => "[@metadata][_id]"}
    remove_field => ["id", "@version", "unix_ts_in_secs"]
  }
}

# Elasticsearch로 output 설정
output {
  # stdout {}
  elasticsearch {
    hosts => "http://localhost:9200"
    index => "inch"
    document_id => "%{[@metadata][_id]}"
  }
}

#=======================================
#            logstash 실행             =
#=======================================
sudo /usr/share/logstash/bin/logstash -f inch.conf 
# sudo /usr/share/logstash/bin/logstash -f /usr/share/logstash/store_store.conf

# 실행
sudo systemctl start elasticsearch.service
sudo systemctl start logstash.service

# 중단
sudo systemctl stop elasticsearch.service
sudo systemctl stop logstash.service

# 검색 최대 개수 설정
curl -XPUT "http://localhost:9200/inch/_settings" -H 'Content-Type: application/json' -d '{"index" :{"max_result_window" : 500000}}'


# test
GET 'http://localhost:9200/inch/_search?size=1&pretty'
{"took" : 2,
 "timed_out" : false,
 "_shards" : {
     "total" : 1,
     "successful" : 1,
     "skipped" : 0,
     "failed" : 0},
 "hits" : {
     "total" : {
         "value" : 10000,
         "relation" : "gte"},
     "max_score" : 1.0,
     "hits" : [
         {
             "_index" : "inch",
             "_type" : "_doc",
             "_id" : "16125",
             "_score" : 1.0,
             "_source" : {
                 "modification_time" : "2022-04-28T01:10:22.000Z",
                 "s_name" : "찡구",
                 "@timestamp" : "2022-04-28T07:09:47.904Z",
                 "s_road" : "인천광역시 남동구 예술로 198",
                 "s_kind" : "기타",
                 "lot" : 126.70195,
                 "s_add" : null,
                 "s_status" : "정상",
                 "lat" : 37.451736
        }}]}}


#=======================================
#               nori 설치              =
#=======================================
# ElasticSearch에서 공식적으로 사용하는 한글 형태소 분석기
# /usr/share/elasticsearch 에서
# nori 설치
sudo bin/elasticsearch-plugin install analysis-nori

# nori 제거
sudo bin/elasticsearch-plugin remove analysis-nori
```
