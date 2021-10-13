-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS emp;


-- COMMAND ----------

desc employee

-- COMMAND ----------

LOAD DATA INPATH '/FileStore/tables/employee.csv' INTO TABLE employee ;


-- COMMAND ----------

select * from employee

-- COMMAND ----------

CREATE EXTERNAL TABLE sales1 (OrderQuantity INT, 
                                UnitPrice FLOAT, 
                                TotalProductCost FLOAT,
                                SalesAmount FLOAT,
                                OrderDate TIMESTAMP,
                                DueDate TIMESTAMP,
                                ShipDate TIMESTAMP) 
                                LOCATION '/user/hive/warehouse/emp.db/sales_loc1'
                                stored as textfile
                                
                                ;

-- COMMAND ----------

use emp

-- COMMAND ----------

LOAD DATA INPATH '/FileStore/tables/Dim_Order.csv' INTO TABLE sales1 ;

-- COMMAND ----------

select * from sales1

-- COMMAND ----------

#default location
dbutils.fs.ls('/FileStore/tables')

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select * from employee

-- COMMAND ----------

LOAD DATA LOCAL INPATH 'C:\Users\pumadevi\Desktop\pyspark csv files\employee' INTO TABLE employee ;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select * from ('/FileStore/tables/employee.csv')

-- COMMAND ----------

create table emp_data as select * from employee

-- COMMAND ----------

create table emp.employee_data as select * from employee

-- COMMAND ----------

LOAD DATA LOCAL INPATH '/FileStore/tables/employee.csv' INTO TABLE emp.employee_data;

-- COMMAND ----------

LOAD DATA INPATH '/user/hive/warehouse/data.txt' INTO TABLE emp.employee;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS emp.dept (
 id int,
 dname string,
 age int,
 gender string )
 COMMENT 'department Table'
 ROW FORMAT DELIMITED
 FIELDS TERMINATED BY ',';

-- COMMAND ----------

desc emp.dept

-- COMMAND ----------

ALTER TABLE emp.dept drop COLUMNS(age , gender);

-- COMMAND ----------

LOAD DATA INPATH 'C:\Users\pumadevi\Desktop\pyspark csv files\dept.csv' INTO TABLE emp.dept;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC dbutils.fs.ls('/FileStore/tables')

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC dbutils.fs.ls('/user/hive/warehouse/emp')

-- COMMAND ----------


