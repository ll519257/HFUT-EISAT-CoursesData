-- 姓名：洪祎麟 班级：电信科20-1班 学号：2020217793


-- （一）根据设计要求，用Create table语句定义基本表

-- 设置当前数据库为EDUC
use EDUC
/*
-- 创建系表
create table department(
	dp_id char(4) primary key,
	dp_name varchar(20) not null,
	dp_head char(10),
	dp_phone varchar(20),
	dp_address varchar(40)
)

-- 创建专业表
create table major(
	m_id char(2) primary key,
	m_name varchar(40) not null,
	m_department char(4) foreign key references department(dp_id)
)

-- 创建教师表
create table teacher(
	t_id char(10) primary key,
	t_name char(10) not null,
	t_department char(4) foreign key references department(dp_id),
	t_phone varchar(20),
	t_email varchar(30)
)

-- 创建学生表
create table student(
	s_id char(10) primary key,
	s_name varchar(20) not null unique,
	s_sex char(2) check(s_sex in('男','女')),
	s_birth datetime,
	t_mj char(2) foreign key references major(m_id)
)

-- 创建课程表
create table course(
	c_id char(4) primary key,
	c_name varchar(30),
	c_credit numeric(2,1),
	c_prec char(4) foreign key references course(c_id)
)

-- 创建学生选课表
create table sc(
	sc_id char(10) foreign key references student(s_id),
	sc_num char(4) foreign key references course(c_id),
	sc_grade numeric(4,1) check (sc_grade>0 and sc_grade<100)
	primary key(sc_id,sc_num)
)



-- （二）用 Alter table 语句修改基本表的结构，以及完整性约束条件

-- 1. 为学生表增加属性：班级：字符型（变长），长度20。
alter table student add s_class varchar(20)

-- 2. 为课程表添加一条完整性约束条件：课程名不允许为空值。
alter table course alter column c_name varchar(30) not null

-- 3. 删除学生表中的班级属性。
alter table student drop column s_class

-- 4. 删除学生表中对学生姓名的唯一值限制。
alter table student drop constraint UQ__student__8D00F45A0726E2B9


*/

-- （三）用Drop table 语句删除基本表

--1. 创建一个新的基本表
create table animation(
	a_name char(10) primary key,
	a_ep varchar(50) not null,
	a_comment varchar(200)
)

--2. 删除该表。
--drop table animation
