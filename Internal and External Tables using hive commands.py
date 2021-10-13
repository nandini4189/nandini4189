# Databricks notebook source

# COMMAND ----------

# MAGIC 
%sql
create database if not exists sales

# COMMAND ----------

# MAGIC 
%sql show databases

# COMMAND ----------

# MAGIC 
%sql
use sales


#CREATING INTERNAL TABLE
# MAGIC 
%sql

create table if not exists sample_2kb
(id int,
category string,
sub_category string,
quantity int,
profit decimal,
col6 decimal,
col7 decimal,
col8 string,
col9 string,
col10 decimal
)
row format delimited
fields terminated by ','

# COMMAND ----------

# MAGIC 
%sql
describe formatted sample_2kb

# COMMAND ----------


#loading data to the internal table sample_2kb
# MAGIC 
%sql

load data inpath '/FileStore/tables/csv/SampleCSVFile_2kb.csv' into table sample_2kb

# COMMAND ----------

# MAGIC 
%sql

select * from sample_2kb

# COMMAND ----------




#CREATING EXTERNAL TABLE

# MAGIC 
%sql

create external table if not exists sample_ext
(id int,
category string,
sub_category string,
quantity int,
profit decimal,
col6 decimal,
col7 decimal,
col8 string,
col9 string,
col10 decimal
)
row format delimited
fields terminated by ','
stored as textfile
location '/user/hive/warehouse/sales.db/sample_11kb';

# COMMAND ----------

# MAGIC
%sql
describe formatted sample_ext

# COMMAND ----------


#loading data to the external table sample_ext

# MAGIC 
%sql

load data inpath '/FileStore/tables/csv/SampleCSVFile_11kb.csv' into table sample_ext

# COMMAND ----------

# MAGIC 
%sql

select * from sample_ext

# COMMAND ----------

# MAGIC 
%sql

truncate table sales.sample_ext

# COMMAND ----------

# MAGIC 
%sql

drop table sample_ext

# COMMAND ----------


