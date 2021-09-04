use mysql_study;

insert into tb_dept(deptId,deptName,deptInfo,lastupdate)
  values(2,'开发部','最牛啤的最酷炫的部门',now());
  
  select*from tb_dept;
  
  
/*
为了避免数据库冗余记录，数据库提供了主键约束
主键字段不可以有两个相同的值，且可以极快的定位到表中的一笔记录
*/

drop table if exists tb_dept;

create table tb_dept
(
   deptId integer primary key comment '部门编号',
   deptName varchar(20) comment '部门名称',
   deptInfo varchar(200) comment'部门描述',
   lastupdate timestamp comment '最后修改时间'
)comment '部门信息表';

SELECT *FROM tb_dept;

insert into tb_dept(deptId,deptName,deptInfo,lastupdate)
  values(1,'邹总办公室','...',now());
  
  insert into tb_dept(deptId,deptName,deptInfo,lastupdate)
  values(2,'开发部','最牛啤的最酷炫的部门',now());
  
  insert into tb_dept(deptId,deptName,deptInfo,lastupdate)
  values(2,'人事部','管理部人员的部门',now());
  
  select * from tb_dept
  
  /*
  主键如果可以自动编号，就不会出现重复添加的错误
  所有数据库提供了字段自动编号的功能，但是仅限于数值字段
  */
  
  drop table if exists tb_dept;
  
  create table tb_dept
  (
  deptId integer auto_increment primary key comment '主键,部门编号',
  deptName varchar(20) comment '部门名称',
  deptInfo varchar(200)comment '部门描述信息',
  lastupdate timestamp comment'最后修改时间'
  )comment'部门信息表';
  
  /*自动增长的字段在添加的时间可以省略*/
  insert into tb_dept(deptName,deptInfo,lastupdate)
    values('邹总办公室','。。。',now());
    
  insert into tb_dept(deptName,deptInfo,lastupdate)
    values('开发部','最酷炫的，最牛逼的部门',now()); 
    
  insert into tb_dept(deptName,deptInfo,lastupdate)
    values('人事部','招聘人的',now());
    
  select * from tb_dept; 
  
  /*不添加部门名称（不合理操作）*/
  insert into tb_dept(deptInfo,lastupdate) values('跳过部门名称添加',now());
  
  select * from tb_dept;
  