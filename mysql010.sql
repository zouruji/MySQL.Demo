use information_schema;
drop database if exists mysql_study_01;
create database mysql_study_01
   default charset utf8mb4 collate utf8mb4_general_ci;
use mysql_study_01;

create table tb_dept
(
   dept_id integer auto_increment primary key comment '主键',
   dept_name varchar(20) unique not null comment '部门名称',
   dept_info varchar(200) comment '部门描述信息',
   enable enum('y','n') default 'y' not null comment '是否启用，默认y',
   lastupdate timestamp on update now() default now() not null comment '信息最后修改时间'
)comment '部门信息表';

insert into tb_dept(dept_name,dept_info)
   values('人事部','人员管理部门');
insert into tb_dept(dept_name,dept_info)
   values('开发部','最厉害的部门');
insert into tb_dept(dept_name,dept_info)
   values('测试部','和开发部作对部门');
insert into tb_dept(dept_name,dept_info)
   values('客户部','面对客户的部门');

select * from tb_dept;
	/*   birthday timestamp not null comment '出生日期',*/
create table tb_employee
(
   eid integer auto_increment primary key comment '编号，主键',
   dept_id integer not null comment '员工所在部门',
   emp_name varchar(20) not null comment '员工姓名',
   sex enum('m','f') default 'm' not null comment'性别',
   salary decimal(10,2) not null comment '工资',
   birthday timestamp not null comment '出生日期',
   lastupdate timestamp on update now() default now() not null comment '信息最后修改时间'
)comment '员工信息表';

insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(3,'邹zz','f',1,'1996-01-09');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(2,'黑xx','m',100,'1991-02-03');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(1,'谢cc','m',10000,'1993-02-01');

insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(2,'邹vv','f',9,'1992-01-09');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(2,'张bb','m',99,'1993-05-03');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(3,'张nn','f',999,'1995-02-01');

insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(3,'黑mm','m',8,'1993-03-09');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday)
  values(2,'姚aa','f',88,'1998-02-03');


select * from tb_employee;

select * from tb_employee e
inner join tb_dept d
on e.dept_id=d.dept_id;
  