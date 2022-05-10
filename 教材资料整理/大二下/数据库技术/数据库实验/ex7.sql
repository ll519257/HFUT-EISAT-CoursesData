-- 姓名：洪祎麟 班级：电信科20-1班 学号：2020217793

--在数据库EDUC中用SQL语句实现如下查询：
--1)	查询学生的总人数。
select count(*) from student

--2)	查询每个专业的专业编号、专业名称、学生人数、学生的平均年龄。
select m_id 专业号,m_name 专业名 ,count(*) 学生人数,avg(datediff(year,s_birth,getdate())) 平均年龄 from major,student where t_mj = m_id group by m_id,m_name

--3)	查询选修了课程的学生人数。
select count(distinct sc_id) from sc

--4)	查询选修了课程“c218”，且成绩超过该课程平均成绩的学生学号、姓名。
select s_id,s_name from student,sc where sc_num=1071 and sc_id=s_id and sc_grade>(select avg(sc_grade) from sc where sc_num = 1071)

--5)	查询每门课的课程号、选课人数、平均成绩、最高分和最低分。
select c_id 课程号,count(sc_id) 选课人数,avg(sc_grade) 平均成绩,max(sc_grade) 最高分,min(sc_grade) 最低分 from course,sc where c_id=sc_num group by c_id

--6)	查询选修课程超过2 门课的学生学号和姓名。
select s_id,s_name from student,sc where s_id = sc_id and exists(select sc_id,count(sc_num) from sc sc1 where sc.sc_id=sc1.sc_id group by sc_id having count(*)>=2)




