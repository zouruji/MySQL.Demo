/*
这里面是注释行，不会被执行
sql-->结构化查询语言，是数据管理的语言标准
MySQL-->dbms-->数据库管理系统。是SqL的管理的实现
知名的dbms还有: microsoft sql sever,oracle,ibm db2
mysqlL是使用量最大的免费数据库,很遗憾的就是mysql被oracle收购了
*/
/*
database:数据库
show databases;就是显示所有的数据库
*/
SHOW DATABASES;
/*
切换当前使用的数据库
mysql是系统管理数据库！！！
不要删除该数据库！！！
最好也不要在这里创建自己的数据表和数据
information_schema information是信息,schema是架构
如果要创建自己的数据库，最好是切换到这两个数据库后执行
mysql的语句是用;号作为语句分隔符！
*/ 
USE mysql; USE information_schema;

/*显示数据库中table表格*/ SHOW TABLES;

/*
创建数据库
create database 数据库名称 
default charset数据编码
collate 字符排序规则；
utf8mb4是支持全球所有常用的语言字符集，包括中文，韩文。。。
utf8mb4_general_ci是对应字符集的排序规则
*/
create_synonym_dbcreate DATABASE mysql_study DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

/*
删除数据库语句，切记不要在生产环境中删除任何数据!!!
drop database 数据库名称;
if exists 表示存在才执行 if如果，exists存在
*/
DROP DATABASE IF EXISTS mysql_study;

/*完整的删除并重新创建数据库的一套语句
1:切换到系统数据库
2:如果数据库存在就删除
3:创建数据库
4:切换到创建的数据库
*/ 
USE information_schema;
DROP DATABASE IF EXISTS mysql_study;
CREATE DATABASE mysql_study;
 Dmysql_studyEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci; USE mysql_study;