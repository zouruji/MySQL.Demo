/*重建并使用数据库musql_study_01*/
/*=======================================*/
use mysql_study_01;

/*查询信息*/
select * from tb_employee e
inner join tb_dept d
on e.dept_id=d.dept_id;

/*等值查询*/
select * from tb_employee
where emp_name='邹zz';

select * from tb_employee
where emp_name='邹vv';

select * from tb_employee where dept_id=2;

/*组合查询*/
select * from tb_employee
where dept_id=2 and sex='f';

select * from tb_employee
where dept_id=2 and sex='f';

/*表达式取反*/
select * from tb_employee
where not dept_id=2;

select * from tb_employee
where  not (dept_id=2 or sex='f');

/*取值范围*/

select * from tb_employee
where salary >=1;

select * from tb_employee
where salary <10;

select * from tb_employee
where salary>=1 and salary<=10;

select * from tb_employee
where birthday>='1992-01-09' and birthday<='1996-08-26';

/*区间查询等效语句*/
/*查询生日在1992-2-01-09的和1996-01-09之间的记录*/
select * from tb_employee
where birthday between '1992-01-09' and '1996-01-09';

select * from tb_employee
where birthday>='1992-01-09'and birthday<='1996-01-09';

select * from tb_employee
where  eid=1  or eid=2 or eid=5 or eid=7 or eid=8;
/*查询eid为1，2，5，7，8的记录*/ 
select * from tb_employee
where eid in (1,2,5,7,8); 

/*模糊查询*/
/*查找姓邹的公务员*/
/*%表示0到任意字符*/
/*查询姓邹的公务员的记录*/
 select * from tb_employee
 where emp_name like '邹%';
 /*查询姓邹的只有两个字的公务员记录*/
 select * from tb_employee
 where emp_name like '邹_';
 /*查询名字中包含文字或者三字的员工记录*/
 select * from tb_employee
 where emp_name like '%黑%'; or emp_name like '%黑%';
 
 /*
 作业
 编写学生数据的等值查询，组合查询，区间查询，模糊查询语句
 */
 /*聚合（统计）和分组*/
 select count(*)from tb_employee
 
 select sex count(*) from tb_employee
 group by sex;
 
 select dept_id,count(*) from tb_employee
 group by dept_id;
 

