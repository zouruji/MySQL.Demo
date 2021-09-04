select sub_id,max(score),min(score) from tb_score
group by sub_id;

select * from tb_student
where  sex= 'm';

select year(birthday),count(*) from tb_student
group by year(birthday);

select  year(birthday),sex,count(*) from tb_student
group by year(birthday),sex;
/**/
select * from tb_student
where year(birthday)=2000 and disable='n';

/*查询学生出生日期或者是否失效*/
select * from tb_student
where  year(birthday) < 2000 or disable='y';

/*查询班主任信息*/
select * from tb_teacher
where tid in(
  select distinct tid from tb_class
);

/*查询参加过3_003考试的学生信息*/
select st.* 
from tb_score sc 
 inner join tb_student st on sc.stu_id=st.sid
 where sc.sub_id='3_003';
 
/*查询课程名称中包含a字母的课程信息*/
select * from tb_subject
where sname like '%a%';

/*显示挂科的学生信息*/
SELECT *
FROM tb_student
where sid in
(
 select distinct stu_id from tb_score
 where score<60
);

/*显示没有考试成绩的课程信息*/
select * from tb_subject
where not sid in
(
  select distinct sub_id from tb_score
);

/*显示没有考试成绩的学生信息*/
select * from tb_student
where not sid in 
(
  select distinct stu_id from tb_score
);
/*参加mysql 数据库考试的2000年出生的男学生信息*/
select st.*
from tb_score sc 
inner join tb_subject su on sc.sub_id=su.sid
inner join tb_student st on sc.stu_id=st.sid
where su.sname='mysql数据库'
and year (st.birthday)=2000 and st.sex='m';

select * from tb_student
 where sid in 
(
 select stu_id from tb_score
 where sub_id in 
 (
 select sid from tb_subject
  where sname='mysql数据库'
 )
)
and year (birthday)=2000 and sex='m';
