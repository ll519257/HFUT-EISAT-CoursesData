-- 姓名：洪祎麟 班级：电信科20-1班 学号：2020217793

/*
--1. 单表查询
（1）查询全体学生的信息；
select * from student

（2）根据专业编号查询学生的学号、性别和年龄；
select * from student where t_mj = 22;

（3）查询未设定先修课的所有课程的信息；
select * from course where course.c_prec is null

（4）查询选修了‘C101’（学生自学设定课程号）号课程，且成绩达到80分的学号。
select sc_id from sc where sc_num = 1071 and sc_grade > 80;
*/


--2. 多表连接查询
   --（1）查询“计算机系”全体学生的学号、姓名、专业名称；
--select s_id,s_name,m_name from student,major where m_id = t_mj and m_department=1001

   --（2）查询非“软件工程”专业，年龄小于20的学生信息；
--select * from student where t_mj <> 23 and datediff(year,s_birth,getdate()) < 20

   --（3）查询先修课是“操作系统”的所有课程的信息；
--select * from course where c_prec = 1094

   --（4）查询至少选修了‘c110’和‘c210’（课程号由学生自学确定！）课程的学生学号和姓名；
--select s_id,s_name from student,sc where sc_num=1071 and sc_id = s_id and exists (select * from sc sc2 where sc_num = 1080 and sc_id = s_id)

   --（5）查询未选修“计算机网络”课程的学生学号、姓名、性别和专业号；
--select s_id, s_name, s_sex, t_mj from student,sc where sc_num <> 1094 and sc_id=s_id

   --（6）查询未选修任何课程的学生学号和姓名。
--select s_id,s_name from student,sc where sc_id = s_id and s_name is null

   --（7）查询未被学生选修的课程号、课程名、先修课。
--select distinct c_id,c_name,c_prec from course,sc where c_id not in (select distinct sc_num from sc)

   --（8）用派生关系查询平均成绩达到90分的学生学号、姓名和平均成绩。
--select s_id '学号',s_name '姓名',avg_grade '平均成绩' from student,(select sc_id,avg(sc_grade) as avg_grade from sc group by sc_id) as sc_avg where avg_grade>90 and sc_avg.sc_id = student.s_id

   --（9）查询学生的学号，只要先修课是“c331”的课程他们都选修了。
--select distinct sc_id from sc sc1 where not exists (select * from course where c_prec = 1071 and not exists (select * from sc sc2 where sc2.sc_num = course.c_id and sc2.sc_id = sc1.sc_id))

   --（10）查询未参加课程“c209”考试的学生名单（学号、姓名、专业号）。
--select s_id,s_name,t_mj from student,sc where sc_id = s_id and sc_num = 1070 and sc_grade is null

