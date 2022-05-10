-- 姓名：洪祎麟 班级：电信科20-1班 学号：2020217793

--1. 数据插入操作
	--依次将准备好的数据用Insert Into语句将数据插入相应的基本表：
--（1）	正确数据的插入插入，这些数据应该不会违反完整性约束
--（2）	注意基本表的先后插入顺序，体会参照完整性。特别要注意课程表的数据插入与其他基本表的不同。
--（3）	对每一个基本表，插入错误的数据，这些数据应该是事先准备好，且违反了基本表的某一个约束条件的。
/*
insert into department values('1001','计算机与信息系','沈明玉',12345678910,'安徽省');
insert into department values('1002','文法系','宣善立',12345678910,'上海市');
insert into department values('1003','经济系','刘健',12345678910,'北京市');
insert into department values('1004','机器系','李华',12345678910,'天津市');
insert into major values(21,'物联网工程','1001');
insert into major values(22,'计算机科学与技术','1001');
insert into major values(23,'人工智能基础','1001');
insert into major values(31,'宪法','1002');
insert into major values(32,'世界法','1002');
insert into major values(41,'世界英语','1003');
insert into major values(51,'机械工程','1004');
insert into major values(52,'自动化','1004');
insert into student values(2020217793,'洪祎麟','男','2003-02-05',21);
insert into student values(2020217123,'张筱宇','女','2002-02-04',21);
insert into student values(2020217111,'白洁','女','2002-06-23',41);
insert into student values(2020217222,'张三','女','2002-06-23',41);
insert into student values(2020217333,'李四','男','2002-01-14',22);
insert into student values(2020217444,'王五','男','2002-10-14',22);
insert into student values(2020217555,'赵六','男','2002-06-29',23);
insert into student values(2020217666,'唐晨超','男','2002-09-29',23);
insert into student values(2020217777,'董八','女','2002-11-04',32);
insert into student values(2020217888,'刘九','女','2002-9-04',32);
insert into student values(2020217999,'杨十','女','2001-5-23',31);
insert into student values(2020217000,'胡玉城','男','2002-5-11',31);
insert into student values(2020217010,'郑涵予','男','2001-09-14',51);
insert into student values(2020217020,'王晓鹏','男','2002-11-04',51);
insert into student values(2020217030,'郑三','男','2001-06-27',52);
insert into student values(2020217040,'刘志远','男','2002-10-27',52);
insert into course values(1071,'机械原理',6,null);
insert into course values(1080,'大学英语',3,null);
insert into course values(1090,'高等数学',6,null);
insert into course values(1094,'程序设计基础',5,null);
insert into course values(1097,'汇编语言与程序设计',3,1094);
insert into course values(1081,'国际英语交流',5,1080);
insert into course values(1095,'概率论与数理统计',5,1090);
insert into course values(1096,'微机原理与接口技术',4,1097);
insert into course values(1010,'JAVA技术',4,1094);
insert into course values(1011,'机器学习',3,1095);
insert into course values(1012,'思想道德修养与法律基础',3,null);
insert into course values(c104,'法学专业导论',3,1012);
insert into course values(1073,'自动控制技术',6,null);
insert into sc values(2020217793,1071,95);
insert into sc values(2020217123,1071,95);
insert into sc values(2020217111,1071,95);
insert into sc values(2020217222,1071,95);
insert into sc values(2020217333,1071,95);
insert into sc values(2020217444,1071,95);
insert into sc values(2020217555,1071,95);
insert into sc values(2020217666,1071,95);
insert into sc values(2020217777,1071,95);
insert into sc values(2020217888,1071,95);
insert into sc values(2020217999,1071,95);
insert into sc values(2020217000,1071,95);
insert into sc values(2020217010,1071,95);
insert into sc values(2020217020,1071,95);
insert into sc values(2020217030,1071,95);
insert into sc values(2020217040,1071,95);
insert into sc values(2020217864,1080,90);
insert into sc values(2020217111,1080,90);
insert into sc values(2020217222,1080,90);
insert into sc values(2020217333,1080,90);


-- 插入错误的数据
insert into department values(5,null,'黄冬冬',11234565856,'安徽省宣城市');
insert into major values(50,null,'1001')
*/
--2．数据修改
    --用Update 语句完成下列任务：
--（1）修改某位学生的专业号，要求包括：修改语句成功执行和修改操作被拒绝两种情形。
update student set t_mj = 22 where s_id = '2020217793';
update student set t_mj = 99999 where s_id = '2020217793';

--（2）修改某门课学生的成绩，学生、课程及成绩由学生自行确定。
update sc set sc_grade = 98 where sc_id = 2020217793

--（3）将选课表中50~59之间的成绩整体增加10分。
update sc set sc_grade = sc_grade+10 where sc_grade >50 and sc_grade<59

--（4）将“Java语言”课程的先修课改为“c209”。（可根据表中数据调整条件数据）
update course set c_prec = 1094 where c_name = 'JAVA技术';


--3. 数据删除
	--用Delete from语句完成下列任务：
--（1）	先在学生表中插入一个专业号为空值的元组。
--insert into student values(849935737,'温柔的风狮子','男','2003-02-05',null);

--（2）	删除学生表中所有未设定专业号的学生。
--delete from student where t_mj is null