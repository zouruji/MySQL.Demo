use mysql_study;

select * from tb_dept;

insert into tb_dept(deptInfo,lastupdate)
values('没给部门名称',now());

drop table if exists tb_dept;
/* not null约束表示字段必须填写值*/
create table tb_dept
(
deptId integer auto_increment primary key comment '主键'
deptName varchar(20) not null comment '部门名称',
deptInfo varchar(200) comment '部门描述',
lastupdate timestamp comment '最后修改时间'
)comment'部门信息表';

select * from tb_dept;

insert into tb_dept(depName,deptInfo,lastupdate)
values('开发部','哦豁,卡卡卡',now());

/*字段唯一性约束，确保字段不会有两个相同的值添加
unique*/

drop table if exists tb_dept;

create table tb_dept
(
deptId integer auto_increment primary key comment '主键',
 deptName varchar(20)   unique not null comment '部门名称',
  deptInfo varchar(200)comment '部门描述',
  lastupdate timestamp comment'信息最后修改时间'
)comment '部门信息表'

select * from tb_dept;

 insert into tb_dept(deptName,deptInfo,lastupdate)
 values('开发部门','天降正义',now());
