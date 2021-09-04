use mysql_study_01;
/*基础查询*/
select * from tb_dept;

select dept_id,dept_name,dept_info,enable,lastupdate from tb_dept;

select enable,dept_name from tb_dept;

select emp_name from tb_employee;

/*
限定查询信息数量
limit最大信息数量
limit 跳过记录数，最大信息数量
*/ 
select * from tb_employee limit 2;

select * from tb_employee limit 3,2;

/* 列别名称*/

select dept_name as '部门名称',dept_info '部门描述' from tb_dept;

/* 去掉重复信息*/

select distinct dept_id from tb_employee;

select distinct dept_id,sex from tb_employee;

/*排序*/
select * from tb_employee order by salary;
select * from tb_employee order by salary desc;

/**/

select * from tb_employee order by sex desc,salary;

/**/

select * from tb_employee order by sex asc;
select * from tb_employee order by sex;

/*统计记录数量*/
select count(*) from tb_employee;
select count(*) from tb_dept;

/*员工数量*/
select count(*) from tb_emoloyee where sex='m';

/*3号部门员工数量*/
select count(*) from tb_employee where dept_id=3;
select count(*) from tb_employee where dept_id=1;
select count(*) from tb_employee where dept_id=4;


/*
修改记录
update 表名称 set 字段=新值。。。
会修改表中所有的记录，一般不会使用！！！
*/

update tb_dept set dept_info='不带条件很危险的修改记录语句';

select * from tb_dept;

update tb_dept set dept_info='正确的修改方式',enable='n'where dept_id=3;

select * from tb_dept;

/*删除数据，一般不要生产数据库中执行*/
/*delete from 表名称 where 数据过滤条件*/
/*删除4号部门*/
delete from tb_dept where dept_id=4;

select * from tb_dept;

/*删表跑路的两个语法*/
delete from  tb_dept;

insert into tb_dept(dept_name,dept_info) values('人事部','xxx');

select * from tb_dept;

/*
练习，创建校园管理数据库
创建班级信息表和学生信息表
要求两张表要有关联关系，要求使用学到过的约束和数据类型
编写挑选字段的查询
编写按照不同字段排序的查询
编写统计记录的查询和男女学生的数量统计查询
编写限制记录数量的查询语句和指定位置数据的查询语句
重置上课的数据库以及记录
*/