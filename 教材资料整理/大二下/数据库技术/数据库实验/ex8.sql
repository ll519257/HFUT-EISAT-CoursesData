-- 姓名：洪祎麟 班级：电信科20-1班 学号：2020217793

/*
--1.定义视图
  --在EDUC数据库中，已Student、Course 和SC表为基础完成一下视图定义:
--1)	定义视图V_SC_G：该视图包含Student、 Course 和SC表中学生的学号、姓名、课程号、课程名和成绩；
create view V_SC_G as	
	select s_id,s_name,c_id,c_name,sc_grade from student,sc,course where s_id = sc_id and c_id=sc_num

--2)定义一个反映学生出生年份的视图V_YEAR，该视图要求使用系统函数来获取当前日期及转换；
  create view V_YEAR(s_id,birth) as
	select s_id,YEAR(GETDATE())-datediff(year,s_birth,getdate()) from student

--3)	定义视图V_AVG_S_G：该视图将反映学生选修课程的门数及平均成绩；
create view V_AVG_S_G(sno,count,avg_grade) as
	select sc_id,count(*),avg(sc_grade) from sc group by sc_id

--4)	定义视图V_AVG_C_G：该视图将统计各门课程的选修人数及平均成绩；
create view V_AVG_C_G(cno,count,avg_grade) as
	select sc_num,count(*),avg(sc_grade) from sc group by sc_num

--5)	定义一个学生表的行列子集视图V_S：该视图包含学生的学号、姓名、专业号；
create view V_S as
	select s_id,s_name,t_mj from student

--6)	定义一个视图V_SC：该视图包含学号、姓名、课程号、成绩。
create view V_SC as
	select s_id,s_name,c_id,sc_grade from sc,course,student where s_id=sc_id and c_id=sc_num

*/

/*
--2.使用视图（下列操作只允许对视图进行）
--1)	查询以上所建的视图结果。
select * from V_SC_G
select * from V_YEAR
select * from V_AVG_S_G
select * from V_AVG_C_G
select * from V_S
select * from V_SC

--2)	查询平均成绩为90分及以上的学生学号、姓名和成绩。
select distinct s_id,s_name,avg_grade from V_SC_G,V_AVG_S_G where sno = s_id and avg_grade>90

--3)	查询科目成绩大于平均成绩的学生学号、课程号、成绩和平均成绩。
select distinct s_id,cno,sc_grade,avg_grade from V_AVG_C_G,V_SC where cno = c_id and sc_grade >= avg_grade

--4)	查询2000年出生的学生学号和姓名。
select V_S.s_id,s_name from V_S,V_YEAR where V_S.s_id = V_YEAR.s_id and birth = 2003

--5)	将学生“张三”的专业号改为“03” （数据视实际数据而定）。
update V_S set t_mj = 23 where s_name='洪祎麟'

--6)	利用视图V_SC将学号为“20180001”、课程号为“c111”的成绩改为85分。
update V_SC set sc_grade = 85 where s_id = 2020217999
*/

