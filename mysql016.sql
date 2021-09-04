/*字符串函数*/
use mysql_study_01;
/*left（字符，从左边取的数量）
  right（字符，从右边取的数量）
  substr（字符，起始位置，长度）
*/
select emp_name,left(emp_name,1) 
,right(emp_name,2),substr(emp_name,2,2)
from tb_employee;

select substr('43072520010115137x',7,8);

/*
concat（字段1，字符2，。。），拼接字符
*/
select concat(emp_name,'(-',sex,'-)',birthday)
from tb_employee;
/*
concat_ws(链接字符，字符1，字符2.。。)
*/
select concat_ws('###',emp_name,sex,birthday)
from tb_employee;

 select eid ,emp_name,birthday,salary
 ,length(eid),length(emp_name)
 ,length(birthday),length(salary)
 ,char_length(emp_name),char_length(salary)
 from tb_employee;
 
 /*trim去掉字符串头尾的空白字符*/
 select concat('--','abc def','--')
 ,concat('--',trim('abc def'),'--');
 
 /*替换字符relace(字符，源字符，替换字符)*/
 select emp_name
 ,replace(emp_name,left(emp_name,1),'*')
 ,replace(emp_name,substr(emp_name,2,2),'**')
 from tb_employee;  
 
 /*repeat，重复生成字符（要重复的字符，数量）*/
 select repeat('*',2);
 
 select emp_name 
 ,concat(left(emp_name,1))
 ,repeat('*',char_length(emp_name)-1)
 from tb_employee;
 
 /*四舍五入round（数值{，保留小数位}）*/
 select avg(salary)
 ,round(avg (salary)),round(avg (salary),2)
 ,floor(avg(salary)),ceiling(avg(salary))
 from tb_employee;
 
 /*绝对值*/
 select abs(-145),abs(145),sign(-145),sign(145),sign(0);
 
 select * from tb_employee where 1=2;
 
 insert into tb_employee
 (dept_id,emp_name,sex,salary,birthday)
 values(100,'部门错误的员工','m',100,'1999-09-09');
 
 /*
   小节
   查询的部分语法结构
   select字段列表
   from 表名称[表别名]
   inner join 附加表 附加表别名
   on 查询表和附加表的关系表达式
   where 数据过滤表达式
   group by 分组统计字段列表
   order by 排序字段列表[desc]
   limit 记录数限制
 */
 
 /*
  添加数据
  insert into 表名（字段1，字段2[，。。。]）
  values（值1，值2[,...]）
 */
 
 /*
  修改数据
  update 表名 set 字段1=新值[,字段n=新值]
  where 数据过滤表达式
 */
 
 /*
 删除数据
 delete from 表名 where 数据过滤表达式
 */
 
 /*
  一个数据库可以包含多个表
  不同数据库可以有相同名称的表，因为数据库是独立的
   反过来，一个数据库中是不能有相同名称的表 
   一个表有多个字段（元组）， 不同字段记录不同的属性数据
   列如要存放学生信息，就需要创建表
   而字段就是学生的属性，例如学号，姓名，性别等等
 */