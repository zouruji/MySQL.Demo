use information_schema;
drop database if exists mysql_study;
create database mysql_study
   default charset utf8mb4 collate utf8mb4_general_ci;
use mysql_study;

create table tb_dept
(
 dept_id integer auto_increment primary key comment '主键',
 dept_name varchar(20) unique not null comment '部门名称',
 dept_info varchar(200) comment '部门描述的信息',
 enable enum('y','x') default 'y' not null comment '是否启用，默认y',
 lastupdate timestamp on update now() default now() not null comment '最后使用时间'
)comment '部门信息表';

insert into tb_dept(dept_name,dept_info)
  values('人事部','人员管理部门');
  
insert into tb_dept(dept_name,dept_info)
  values('开发部','搞事最多的部门');
  
insert into tb_dept(dept_name,dept_info)
  values('测试部','和开发部作对的部门');
  
select * from tb_dept;

/*
 关系数据，添加员工信息表
 添加员工必须指定所在部门，所以会和部门表产生关联
 decimal是十进制小数，括号里面的参数是整数位长度，小数位长度
*/
create table tb_employee
(
 eid integer auto_increment primary key comment '编号，主键',
 dept_id integer not null comment '员工所在部门',
 emp_name varchar(20) not null comment '员工姓名',
 sex enum('m','f') default 'm' not null comment '性别',
 salary decimal(10,2) not null comment '工资',
 lastupdate timestamp on update now() default now() not null comment '信息最后修改时间'
)comment '员工信息表';

/*
添加员工信息需要指定所在部门的部门编号信息
*/
insert into tb_employee(dept_id,emp_name,sex,salary)
  values(1,'人事部','m',10000);
  
/*2号部门的员工*/
insert into tb_employee(dept_id,emp_name,sex,salary)
  values(2,'大保健','m',5678.90);
insert into tb_employee(dept_id,emp_name,sex,salary)
  values(2,'查丽莎','f',6666.66);
insert into tb_employee(dept_id,emp_name,sex,salary)
  values(2,'安娜','m',1234.5);
  
/*3号部门的员工*/
insert into tb_employee(dept_id,emp_name,sex,salary)
  values(3,'查丽莎','f',1000);

select * from tb_employee;
/*
关系表的联合查询
表后面跟一个字符表示表的别名称
inner join表示加入其它表信息
on子句是加入表和当前表的关联关系表达式
e.dept_id=d.dept_id表示员工表中的dept_id的值对应到部门表中的dept_id
*/
select * from tb_employee e
inner join tb_dept d
on e.dept_id=d.dept_id;

/*
常见关系表的示例，省份城市联动
*/
create table tb_province
(
pid integer auto_increment primary key comment '主键，省份编号',
province varchar(255) unique not null comment '省份名称'
)comment '省份信息表';

insert into tb_province(province) values('湖南省');
insert into tb_province(province) values('湖北省');

select * from tb_province;

create table tb_city
(
cid integer auto_increment primary key comment '主键，城市编号',
pid integer not null comment '所在省份',
city varchar(255) not null comment '城市名称'
)comment '城市信息表';

/*湖南的城市*/
insert into tb_city(pid,city) values(1,'长沙');
insert into tb_city(pid,city) values(1,'常德');
insert into tb_city(pid,city) values(1,'岳阳');

/*湖北的城市*/
insert into tb_city(pid,city) values(2,'武汉');
insert into tb_city(pid,city) values(2,'宜昌');

select * from tb_city;

select * from tb_city a
inner join tb_province p
on a.pid=p.pid;

select * from tb_employee where dept_id=2;