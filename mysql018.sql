use mysql_study_01;

/*
子查询 将查询放置在括号中就叫子查询
子查询可以放在判断条件的表达式中！！！
由于判断添加只能是但一值，所以对应要求子查询的结果也只能是单一值
*/
/*查询没有员工的部门*/

select * from tb_dept
where  not dept_id in
(
select distinct dept_id from tb_employee
);

/*查询比平均工资高的员工*/
select * from tb_employee
where salary >
(select avg(salary) from tb_employee);

/*子查询也可以用于计算*/
select *, salary-(select avg(salary)from tb_employee) 'sub'
,sign(salary-(select avg(salary)from tb_employee)) 'res'
from tb_employee;

/*子查询当成表!!!!*/
select emp_name,ceiling(sub),res,sex from
(
select *, salary-(select avg(salary)from tb_employee) 'sub'
,sign(salary-(select avg(salary)from tb_employee)) 'res'
from tb_employee
)temp
where res<0
order by sub;

/* 
一般来说，如果要显示的列在其它表中就要使用join
如果是判断条件，计算条件是通过其它方式
或者在其它表中就使用子查询
因为join会拖慢查询（关联多表的原因）
而子查询可以过滤筛选选掉记录后再运算，效率更高  
*/

/*
 database 数据库
 table 表格
 dbms：database manage system 数据库管理系统
 （常见的dbms：mysql，sql server，oracle）
 表由字段（元组组成）
 常见的字段数据类型
 int：整数，timestamp:时间日期，varchar：变长字符串
 char：定长字符串，float：浮点数（小数）
 decimal：指定位数的十进制小数
 enum：枚举值
 数据库创建与删除
 drop database 数据库名;
 create database 数据库名 数据库配置参数;
 切换当前使用的数据库
 use 数据库名;
 表的创建与删除
 drop table 表名称;
 create table 表名称（字段列表）;
 表的约束
 primary key 主键
 auto_increment 自动增长
 not null 非空
 default 默认值
 unique 唯一
 表记录添加
 insert into 表名（字段列表） values（值列表）;
 表记录修改
 update 表名 set 字段1=新值1[,....]where 记录过滤
 表记录删除
 delete from 表where 记录过滤
 表重置
 truncate table 表名;
 查询
 select 字段列表
 from 表[表别名]
 [inner| left |right] join 关联表名[关联表别名]
 on 表关系表达式
 where 记录过滤表达式
 group by 分组字段列表
 [having 分组过滤表达式]
 order by 排序字段列表
 limit n[,m]限制记录数
*/

/*练习子查询和联合语句*/