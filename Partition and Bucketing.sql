-- Databricks notebook source
create database sales_loc

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS emp1 (
 id int,
 ename string,
 age int,
 gender string )
 COMMENT 'employe Table'
 ROW FORMAT DELIMITED
 FIELDS TERMINATED BY ',';

-- COMMAND ----------

desc emp1

-- COMMAND ----------

load data inpath '/FileStore/tables/employee.csv' into table emp1

-- COMMAND ----------

select * from emp1

-- COMMAND ----------

create table gender_part(id int, ename string,age int) PARTITIONED BY(gender string);

-- COMMAND ----------

select * from gender_part

-- COMMAND ----------

set hive.exec.dynamic.partition.mode=nonstrict

-- COMMAND ----------

INSERT OVERWRITE TABLE gender_part PARTITION(gender)
SELECT t.* from  emp1 as t where gender='female';

-- COMMAND ----------

select * from gender_part

-- COMMAND ----------

desc gender_part

-- COMMAND ----------

describe formatted emp1

-- COMMAND ----------

create table if not exists bucketing
(id int,
category string,
sub_category string,
quantity int,
profit decimal
)
row format delimited
fields terminated by ','
escaped by '"'
partitioned by (category_type string)
clustered by (id) into 20 buckets
stored as textfile

-- COMMAND ----------

desc bucketing

-- COMMAND ----------

load data inpath '/FileStore/tables/sales_cols.csv' into table bucketing partition (category_type='furniture')


-- COMMAND ----------

select * from bucketing

-- COMMAND ----------


