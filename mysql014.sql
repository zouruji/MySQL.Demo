/*重建数据库*/

/*===================================*/
use information_schema;
drop database if exists ketang;
create database ketang
   default charset utf8mb4 collate utf8mb4_general_ci;
use ketang;


/*课程信息表*/
create table tb_subject
(
 sid integer auto_increment primary key comment '课程编号，主键',
 sname varchar(50)unique not null comment '课程名称',
  sinfo varchar(500) not null comment'课程信息'
)comment'课程信息表';

select * from tb_subject;

/*学生信息表*/
create table tb_student
(
 sid integer auto_increment primary key comment '学生编号，主键',
 sname varchar(20) not null comment'学生姓名',
 phone varchar(20) unique not null comment '电话号码',
 address varchar(500) comment '家庭地址',
 birthdy timestamp comment'出生日期',
 enable enum('y','n') default 'y' not null comment '是否启用'
)comment'学校信息表';

select * from tb_student; 