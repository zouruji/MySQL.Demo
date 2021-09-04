use  mysql_study;

select * from tb_dept;

/* 最后修改的时间可不可以跟随添加修改记录的时间
而不用填写
*/


 drop table if exists tb_dept;
 
 create table tb_dept
 (
 deptId integer auto_increment primary key comment '主键',
 deptName varchar (20) unique not null '部门名称',
 deptInfo varchar (200) not null '部门描述信息',
 lastupdate timestamp on update now() default now() not null 
 comment '信息最后修改时间'
 )comment'部门信息表';
 
 /*on update now() 表示当记录被修改的时候，字段的值自动填写为now（）
 default now() 表示当记录添加的时候，字段的值自动填写为now（）
 所有该约束称为默认值
 需要注意的是，默认值只在字段值没有填写的时候才会生效
 如果给出了字段，将会以给出的值为准！！！
 */
 /*不给时间添加信息*/
 insert into tb_dept(deptName,deptInfo) 
 values ('开发部','开发部门');
 /*给时间的情况*/
 insert into tb_dept(deptName,deptInfo,lastupdate)
 values('人事部','管人的','2010-10-12 09-10-11')
 
 select * from tb_dept;
 
 
 /* 一般来说，部门信息会和员工信息关联   所有不能轻易的删除部门信息
 那么怎么做到不删除记录又标识部门其实不存在了
 */
 
 
 create table tb_dept
 (
 deptInd integer auto_increment primary key comment '部门编号',
 deotName varchar(20)unique not null comment '部门名称',
 deptInfo varchar(200) comment '部门描述信息',
 enable enum('y','n') default 'y'not null comment '部门是否启用',
 lastupdate timestamp on update now() default now() now null
 comment'信息最后修改时间'
 )comment'部门信息表';
 
 /*
 enum是枚举数据类型，表示字段的取值只能是括号中列表的值
 列如 enum（1，2，4）表示字段的取值只能是1，2，4三中一个
 */
 
 /* 不是枚举的值（m）无法添加*/
 
 insert into tb_dept(deptName,depyInfo,enable)
 values('人事部','人事部门','m');
 
 /*y和n都可以*/
insert into tb_dept(deptName,deptInfo,enable)
values('开发部','开发部门','y');
insert into tb_dept(deptName,deptInfo,enable)
values('人事部','人员管理部门'，'n');
   
insert into tb_dept (deptName,deptInfo)
values('测试部','测试部门');
   
