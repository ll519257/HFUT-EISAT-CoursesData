import pymysql

db = pymysql.connect(host="localhost", user="root", password="", database="INFOQ1")# 自己的数据库密码
cursor = db.cursor()
sql = """CREATE TABLE STU
(
    SNO CHAR(10),
    SNAME VARCHAR(20) NOT NULL,
    SSEX CHAR(2),
    SAGE INT,
    SDEPT CHAR(2),
    PRIMARY KEY(SNO),
    CHECK(SSEX IN ('M','F'))
);
    CREATE TABLE COURSE(
    CNO INT,
    CNAME VARCHAR(20) NOT NULL,
    CPNO INT,
    CCREDIT INT NOT NULL,
    PRIMARY KEY(CNO)
);
CREATE TABLE SC(
    SNO CHAR(10),
    CNO INT,
    GRADE INT,
    FOREIGN KEY(SNO) REFERENCES STU(SNO),
    FOREIGN KEY(CNO) REFERENCES COURSE(CNO)
);
INSERT INTO STU VALUES ('2019217864','任瑞凯','M',19,'DX');
INSERT INTO COURSE VALUES(1,'MATH',null,6);
INSERT INTO COURSE VALUES(2,'DB_DESIGN',3,2);
INSERT INTO COURSE VALUES(3,'P_DESIGN',4,3);
INSERT INTO COURSE VALUES(4,'OS',null,2);
"""
cursor.execute(sql)
db.close()
