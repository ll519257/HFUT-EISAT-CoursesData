-- 姓名：洪祎麟 班级：电信科20-1班 学号：2020217793

use EDUC

/*
-- 1. 用SQL语句分别建立以下索引
-- （1）应用场景：在教务管理系统中，经常需要通过学生的项目查询学生的基本信息，学生人数大概在10000～20000人，
--      为了提高这类查询的效率，需要为学生表的学生姓名创建一个普通降序索引，索引名称为：Stusname。

create index Stusname on student(s_name desc)

-- （2）应用场景：在应用中，学生表与专业表经常会一起使用，比如在查询学生信息时会同时需要了解学生所学的专业信息。
--      故这两个表经常需要进行连接，为了提高连接效率，需要为学生表的专业编号创建一个普通升序索引，索引名称为：Stuspno。

create index Stuspno on student(t_mj asc)

--（3）应用场景：学生选课表SC是EDUC数据库中数据量最大的表，数据的变化也最频繁，实际应用中数据操作的条件以：
--     Where Sno=’20200001’ and Cno=’c101’的形式居多，为了提高查询效率，需要为SC表的学号和课程号创建一个组合索引，
--     其中学号为升序, 课程号为降序。索引名称为：SCsno_cno。

create index SCsno_cno on sc(sc_id asc,sc_num desc)

--（4）应用场景：学校教学管理规定，不同的课程使用不同的课程编号，且课程名称也应该把它，
--     为此在创建基本表时已经为课程表的课程名定义了一个完整性约束规则：课程名必须唯一，若系统自动创建的唯一索引消失了，
--     需要重新为课程名创建一个唯一索引，索引名为：Unicname。

create unique index Unicname on course(c_name)
*/

--2. 用SQL语句删除索引Stuspno。

drop index student.Stuspno
