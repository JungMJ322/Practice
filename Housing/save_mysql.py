# user, password, url, driver를 전역변수로 선언했으면 더 보기 좋았을 것 같음
from pyspark.sql import SparkSession
import json
spark = SparkSession.builder.master('local[1]').appName('jsonToMysql').getOrCreate()


# hadoop에서 불러올 파일 이름과, mysql table 이름을 파라미터로 주면 그대로 mysql에 저장해주는 함수
def save_mysql(filename, table_name):
    rdr = spark.read.format('json').option("multiline", "true").json(f'/Housing/data/json/{filename}')
    user = "root"
    password = "1234"
    url="jdbc:mysql://localhost:3306/Housing"
    driver = "com.mysql.cj.jdbc.Driver"
    dbtable = table_name
    df_spark = spark.createDataFrame(rdr)
    df_spark.write.jdbc(url, dbtable, "overwrite", properties={"driver": driver, "user": user, "password": password})


# list와 mysql table이름을 파라미터로 주면 list를 mysql에 저장해 주는 함수
def save_list_to_db(list_data, table_name):
    df_data = spark.createDataFrame(list_data)
    user = "root"
    password = "1234"
    url="jdbc:mysql://localhost:3306/Housing"
    driver = "com.mysql.cj.jdbc.Driver"
    dbtable = table_name
    df_data.write.jdbc(url, dbtable, "overwrite", properties={"driver": driver, "user": user, "password": password})



if __name__ == '__main__':
    save_mysql('park.json', 'park')