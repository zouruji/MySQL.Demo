use school_manager;

select s.*,c.cname,t.name
from tb_student s 
inner join tb_class c on s.cid=c.cid
inner join tb_teacher t on c.tid=t.tid;



select * from tb_student
where sex='m';

select * from tb_score
where stu_id in
(
select sid from tb_student
where sex='f'
);

select sc.*,st.*
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid
where st.sex='f';

select * from tb_teacher
order by salary desc
limit 2,4;