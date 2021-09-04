use mysql_study;

/*
  一般情况下，最后更新时间就是操作数据的时刻（now（））
  如果能自动默认填写为当前时间就简单了
  on update now（）表示当记录修改的时间默认更新字段的值为now（）
  default now（）表示添加记录时，如果没有给出字段的值就默认now（）
*/

drop table if exists tb_dept ;

create table tb_dept 
(
deptId integer auto_increment primary key comment '部门编号',
deptName varchar(50) unique not null comment '部门名称',
deptInfo varchar(200) comment '部门描述信息',
lastupdate timestamp on update now() default now() not null comment'信息最后修改时间'
)comment '部门信息表';

select * from tb_dept;

insert into tb_dept(deptName,deptInfo)
values ('人事部','人员管理部门');
insert into tb_dept(deptName,deptInfo,enable)
values('开发部','最炫酷的,专门搞事情的部门','y');
insert into tb_dept(deptName,deptInfo,enable)
values('测试部','专业找开发部麻烦的部门','n');

select*from tb_dept;