#!/usr/bin/env bash

hdfs dfs -mkdir /Housing
sleep 5

hdfs dfs -mkdir /Housing/data
sleep 5 

spark-submit /home/wovlf139/Housing/module/data_collection/data_collection.py
sleep 5 

hdfs dfs -put /home/wovlf139/Housing/data/hadoop_upload /Housing/data
sleep 5 

spark-submit /home/wovlf139/Housing/module/data_process/data_process.py
sleep 5

exit 0