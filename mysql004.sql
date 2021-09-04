/*下面四行时删除数据库zouye并重建*/
/*====================================*/
use information_schema;
drop database if exists zuoye ;
create database zuoye
default charset utf8mb4 collate utf8mb4_general_ci;
use zuoye
/*================================*/

/*删除并重建tb_banji表*/

dtb_banjitb_deptrop table if exists tb_banji;

create table tb_banji
(
 bianhao integer auto_increment primary  key comment '主键，班级编号',
 mingcheng varchar(20) comment'班级名称',
 miaoshu varchar(500)comment'班级描述',
 xiugaishijian timestamp comment '最后的修改时间'
)comment'班级信息表';

SELECT *FROM tb_banji;

insert into tb_banji;(mingcheng,miaoshu,xiugaishijian)
 values('软件1801','就是技术最牛逼的专业的201818级',now());
 
 insert into tb_banji;(mingcheng,miaoshu,xiugaishijian)
 values('软件1901','就是技术最牛逼的专业的190119级',now());
 
select * from tb_user;

insert into tb_user(username,password,email,reg_time)
values('hpx','hpx123','hpx@qq.com',now());
insert into tb_user(username,password,email,reg_time)
values('lzw','123456','1234567@qq.com',now());
insert into tb_user(username,password,email,reg_time)
values('zouruji','abc-123','zouruji@qq.com',now());

select* from tb_user where username='hpx250' and password='hpx123';
