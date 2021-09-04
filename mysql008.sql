/*删除并重建mysql_total_01数据库*/
/*==============================================*/
use information_shema;
drop database if exists mysql_total_01;
create database mysql_total_01
default charset utf8mb4 collate utf8mb4_general_ci;
use musql_total_01;
/*==================================*/

/*创建注册用户信息表*/

/*==============================*/
create table tb_user
(
 uid integer auto_increment primary key not null comment '主键',
 phone varchar(20) unique not null comment'电话号码',
 password varchar(20) not null comment '登录密码',
 nickname varchar(100) default '该用户很搓，没有填写'comment'昵称',
 disable enum('y','n')default 'n' comment '用户是否冻结',
 lastupdate timestamp on update now() default now() not null
 comment'用户信息最后修改时间'
)comment '注册用户信息';


/*===================================================*/
/*内置用户信息*/
insert into tb_user(phone,password,inckname)
  values('232345646','super-user','内置用户');
insert into tb_user(phone,password,nickname)
  values('15645645','abc-123','测试用户');
performance_schemaselect * from tb_user;
/*===================================*/