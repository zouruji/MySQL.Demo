use school_manager;
/*查询考试成绩，并显示完整的学生信息*/
select sc.*,st.*
from tb_score sc 
inner join tb_student st on sc.stu_id=st.sid;
/*查询考试成绩，并显示完整的课程信息*/
select sc.*,su.*
from tb_score sc
inner join tb_subject su on sc.sub_id=su.sid;
/*查询考试成绩，并显示完整的学生信息和课程信息*/
select a.*,b.*,c.*
from tb_score a
inner join tb_subject b on a.sub_id=b.sid
inner join tb_student c on a.stu_id=c.sid;
/*查询考试成绩，并显示完整的学生信息和班级信息*/
select  a.*,b.*,c.*
from tb_score a
inner join tb_student b on  a.stu_id=b.sid
inner join tb_class c on  c.cid=b.cid;
/*查询考试成绩，并显示完整的学生信息和班级信息以及班主任信息*/
select sc.*,st.*,cl.*,te.*
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid
inner join tb_class cl on st.cid=cl.cid
inner join tb_teacher te on cl.tid=sc.sid;

/*查询考试成绩，并显示完整的学生信息和班级信息以及班主任信息和课程信息*/

/*查询考试成绩，显示学生姓名，课程名称，成绩，班级名称，班主任名称*/
select st.sname '学生姓名'
,su.sname '课程名称'
,sc.score'成绩'
,c.cname'班级名称'
,t.name '班主任名称'
from tb_score sc 
inner join tb_student st on sc.stu_id=st.sid
inner join tb_subject su on sc.sub_id=su.sid
inner join tb_class c on st.cid=c.cid
inner join tb_teacher t on c.tid=t.tid;