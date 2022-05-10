-- 姓名：洪祎麟 班级：电信科20-1班 学号：2020217793
-- 创建数据库（EDUC）

create database EDUC
on (
	name=EDUC_data,
	filename='E:\MYDB\EDUC.mdf',
	size=10,
	maxsize=60,
	filegrowth=5%
)
log on(
	name=EDUC_log,
	filename='E:\MYDB\EDUC.ldf',
	size=4,
	maxsize=10,
	filegrowth=1
)



-- 创建数据库（TestDB)
/*
create database TestDB
on (
	name=TestDB_data,
	filename='E:\MYDB\TestDB.mdf',
	size=10,
	maxsize=60,
	filegrowth=5%
)
log on(
	name=TestDB_log,
	filename='E:\MYDB\TestDB.ldf',
	size=4,
	maxsize=10,
	filegrowth=1
)
*/

-- 删除TestDB数据库
--drop database TestDB

-- 设置当前数据库为EDUC
--use EDUC

