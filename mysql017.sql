use mysql_study_01;

/*联合查询*/

select * from tb_dept;

select * from tb_employee;

insert into tb_emoloyee(dept_id,emp_name,sex,salary,birthday)
values(100,'部门错误的员工','m',10000,'1999-09-09');

/*
   当要显示的字段不在本表中的时候，需要将其它表加入的时候
   需要联合多表查询，第一种联合查询，也是最常见的联合
   叫做内连接，也叫自然连接
   只有关连的表对应关系数据在两张表都存在的记录才会出现
*/

/*
  格式：
  select 夺表的字段
  from 主记录表 主表别名
  inner join 联合表1  联合表1  别名on 联合表关系表达式
  [...]
*/
select e.*,d.*  from tb_employee e 
inner join tb_dept d on e.dept_id=d.dept_id;

/*
 左外连接
 和内连接一个区别，就是join语句左边表的记录必须出现
*/

select e.*,d.*from  tb_employee e 
right join tb_dept d on e.dept_id=d.dept_id;

/*
 交叉连接，没看到过有人使用
 有估计也是写错了，结果是join两张表的笛卡儿积
*/

select * from tb_employee e,tb_dept d;

/* 内连接的另一种写法，就是因为它，有人写错成交叉连接*/
select * from tb_employee e,tb_dept d
where e.dept_id=d.dept_id;

/*内连接综合，一旦连接成功，两个表的字段可以任意使用*/
select e.eid,e.emp_name,e.sex,e.salary,d.dept_name
from tb_employee e 
inner join tb_dept d on e.dept_id=d.
+
where d.dept_name ='开发部'
order by e.salary
limit 3;

/*记录合并*/
select dept_id'编号',dept_name '名称','部门'as'类型'from tb_dept
union
select eid'编号',emp_name '名称','员工'as'类型'from tb_employee;

/*
 取值变换
 性别取值是m，f，分别代表男，女
 取值变换可以将数据的值通过判断转换成其它格式和值
 两种取值变换（case语句）的格式
 1：单一值判断
 case 字段when 字段值1 then 变换值1...
 else 所有的when都没有匹配的时候的变换值
 end
*/

select *, case sex 
when'm' then'男生'
when'f' then'女生'
else '不正常的' 
end
from tb_employee;

select emp_name,
case sex when 'm' then'男员工' when'f' then'女员工'
end 'sex'
from tb_employee;

/*
 取值变换2，区间变换，将不同的工资段成白领，蓝领。。
 case when 区间判断表达式1 then 转换值1
 [...]else 所有区间判断都不匹配的转换值end
*/

select emp_name,
case when salary<=3000 then'蓝领'
when salary<=6000 then '白领'
when salary<=10000 then '只有战斗使我快乐'
else '最强王者' end
from tb_employee;

select emp_name,
case when salary<=3000 then'❤❤'
when salary<=6000 then '⭐⭐'
when salary<=10000 then '⭐※'
else '🚗 ✈' end
from tb_employee;


/* 
练习题1： 创建学生和班级信息表，学生和班级要有关联关系
编写各类联合查询的语句
创建教师信息表，在一个查询结果中同时显示学生和教师信息
练习题2：教师表添加是否离职手续，取值为y/n
编写值转换语句，将y转换成已经离职，n转换为在职员工
编写值转换语句，将教师工资转换成技能等级
工资越高的技能等级越高
*/
