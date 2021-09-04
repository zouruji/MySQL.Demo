use mysql_study;
/*
创建数据表
cereate table 表名称
(字段列表
字段的名称 字段的类型;
数据类型：integer-整数，
varchar(最大长度)-不一定长字符串，最大不能超过括号里面指定的长度
timestamp:时间截
)comment'表的描述信息';
*/
create table tb_dept
(
deptId integer comment'部门编号',
deptName varchar(20) comment'部门名称',
deptInfo varchar(200) comment'部门描述信息',
lastupdate timestamp comment'信息最后修改时间'
)comment'部门信息表';

show tables;

/*删除表格的语句（不要在系统数据库和生成环境中使用）
如果表存在就删除
drop table if exists 表名称;
*/
drop table if exists tb_dept;

show tables;
/*dbms管理多个数据库，数据库里面有多个表*/

use mysql_study;
drop table if exists tb_dept;
create table tb_dept
(
deptId integer comment'部门编号',
deptName varchar(20) comment'部门名称',
deptInfo varchar(200) comment'部门描述信息',
lastupdate timestamp comment'信息最后修改时间'
)comment'部门信息表';
show tables;

/*
添加数据的语句
字段列表和值列表要对应上，now（）是获取系统当前时间
*/
insert into tb_dept(deptId,deptName,deptInfo,lastupdate)
 values(1,'总裁办公室','霸道总裁办公地址',now());

insert into tb_dept(deptId, deptName, deptInfo, lastupdate)
values (2,'副总裁办公室','副总裁会议室地址',now());

insert into tb_dept(deptId, deptName, deptInfo, lastupdate)
values (3,'副总裁办公室','副总裁牛逼nice',now());
/*
查询表中的数据
*/
select * from tb_dept;
# 删除表格数据
# drop table  tb_userZrj1.runoob_tbl;

# 删除单行数据
delete  from tb_dept where deptid = '2';
