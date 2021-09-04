/*聚合（统计）和分组*/
/* 统计员工数量*/
select count (*) from tb_employee;

/*count里面如果是*号，就会统计表中的全部记录
  如果里面是字段，会统计字段不是null的记录，所以
  一般都会用*号
*/

select count(eid) from tb_employee;

/*查看员工的最高工资*/
select max(salary) from tb_employee;

/*查看员工的最低工资*/
select min(salary) from tb_employee;

select max(salary),min(salary) from tb_employee;
/*min，max 可以用于日期等数据类型*/
select max(birthday),min(birthday) from tb_employee;

/*计算工资总和*/
select sum(salary) from tb_employee;

/*平均工资*/
select avg(salary) from tb_employee;

/*查看部门编号为2的员工工资总和*/
select sum(salary) from tb_employee where dept_id=2;

/*分组统计*/
/*分部门统计工资总和*/
/*如果select后面出现了聚合函数列，那么所有的非聚合函数列都必须出现在group by 中！！！！
反过来不成立，在group by 中的列不一定要出现在select中
*/
select sum(salary) from tb_employee
group by dept_id;

/* 按照性别统计平均工资*/
select sex,avg(salary) from tb_employee
group by sex;

/*按照部门统计人数*/
select dept_id,count(*) '人数'from tb_employee
group by dept_id;

/*按照部门分别统计男女员工数量*/
select dept_id,sex,count(*)from tb_employee
group by dept_id,sex;

/*找到各个部门年龄最大的员工*/
select dept_id,min(birthday) from tb_employee
group by dept_id;

/*找到部门中男女员工的最高工资*/
select dept_id,sex,max(salary) from tb_employee
group by dept_id,sex;

/* 作业，在校园管理数据库中练习分组*/