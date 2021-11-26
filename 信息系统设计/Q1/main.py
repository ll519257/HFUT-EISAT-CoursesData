import pymysql
import ui
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QTableWidgetItem
import sys
'''

datr:2021/7/7
'''
db = pymysql.connect(host="localhost", user="root", password="", database="INFOQ1")#输入自己的密码
cursor = db.cursor()


# 输入为新增学生的信息，返回值为成功与否
def addNewStu(SNO: str, SNAME: str, SSEX: str, SAGE: str, SDEPT: str) -> bool:
    if len(SNO) != 10 or len(SNAME) > 20 or len(SDEPT) > 2 or SSEX not in ['M', 'F']:
        infoRaise("输入参数有误")
        return 0
    # print("INSERT INTO STU VALUES "+"(\'"+SNO+"\',\'"+SNAME+"\',\'"+SSEX+"\',"+SAGE+",\''"+SDEPT+"\')")
    try:
        cursor.execute(
            "INSERT INTO STU VALUES " + "(\'" + SNO + "\',\'" + SNAME + "\',\'" + SSEX + "\'," + SAGE + ",\'" + SDEPT + "\')")
        db.commit()
    except:
        db.rollback()
        infoRaise("新增语句语法有误")
        return 0
    infoRaise("添加成功")
    return 1


# #可变参数模板
# def name(canshu1:str,canshu2,**kwargs)->bool:
# #装饰器

# 修改表
def updateStu(SNO: str, **kwargs) -> bool:
    args = dict(**kwargs)
    # print(args)
    listdel = []
    for k, v in args.items():
        if v == "":
            listdel.append(k)
    for i in listdel:
        del args[i]
    # print(args)
    str1 = "UPDATE STU SET "
    # print(len(args.keys()))
    k = list(args.keys())
    for i in range(len(k)):
        if args[k[i]] != "SAGE":
            str1 += k[i] + "=\'" + args[k[i]] + "\'"
        else:
            str1 += k[i] + "=" + args[k[i]]
        if i == len(args.keys()) - 1:
            str1 += " "
        else:
            str1 += ","
    str1 += "WHERE SNO=\'" + SNO + "\'"
    # print(str1)
    try:
        cursor.execute(str1)
        db.commit()
    except:
        infoRaise("更改语句语法有误/不满足约束")
        return 0
    infoRaise("修改成功")
    return 1


# 删除学生
def deletStu(SNO: str) -> bool:
    if len(SNO) != 10:
        infoRaise("输入参数有误")
        return 0
    str1 = "DELETE FROM STU WHERE SNO=\'" + SNO + "\'"
    # print(str1)
    try:
        cursor.execute(str1)
        db.commit()
    except Exception as e:
        print(repr(e))
        infoRaise("删除语句语法有误")
        return 0
    infoRaise("删除学生成功")
    return 1


def selectCourse(SNO: str, CNO: str) -> bool:
    cursor.execute("SELECT * FROM SC WHERE SNO=\'" + SNO + "\' AND CNO=" + CNO)
    if cursor.fetchone() != None:
        infoRaise("该学生已经选过本门课程！")
        return 0
    cursor.execute("SELECT * FROM COURSE WHERE CNO=" + CNO)
    tuple1 = cursor.fetchone()
    if tuple1 != None:
        if tuple1[2] != None:
            cursor.execute("SELECT * FROM SC WHERE SNO=\'" + SNO + "\' AND CNO=" + str(tuple1[2]))
            if cursor.fetchone() == None:
                infoRaise("该学生未完成先修课！")
                return 0
    try:
        cursor.execute("INSERT INTO SC VALUES (\'" + SNO + "\'," + CNO + ",null)")
        db.commit()
    except:
        infoRaise("选课语句语法有误")
        return 0
    infoRaise("选课成功")
    return 1


# 删除某个学生选课表中的选课
def deleteSC(SNO: str) -> bool:
    if len(SNO) != 10:
        infoRaise("学号长度有误")
        return 0
    str1 = "DELETE FROM SC WHERE SNO=\'" + SNO + "\'"
    try:
        cursor.execute(str1)
        db.commit()
    except:
        infoRaise("重置选课语法错误")
        return 0
    infoRaise("删除成功")
    return 1


def updateTable(ui):
    cursor.execute("SELECT * FROM STU")
    res = cursor.fetchall()
    ui.table.setRowCount(len(res))
    for i in range(len(res)):
        for j in range(len(res[i])):
            ui.table.setItem(i, j, QTableWidgetItem(str(res[i][j])))
    infoRaise("刷新成功")


def checkCourse(SNO: str, up):
    if up.checkBox.isChecked():
        selectCourse(SNO, "1")
    if up.checkBox_2.isChecked():
        selectCourse(SNO, "2")
    if up.checkBox_3.isChecked():
        selectCourse(SNO, "3")
    if up.checkBox_4.isChecked():
        selectCourse(SNO, "4")


def end():
    db.close()
    sys.exit()


def events(up):
    # infoRaise("x1111")
    # updateTable(up)
    # print(up.lineEdit.text())
    up.pushButton.clicked.connect(lambda: checkCourse(up.lineEdit.text(), up))
    up.pushButton_2.clicked.connect(lambda: deleteSC(up.lineEdit.text()))
    up.pushButton_3.clicked.connect(
        lambda: addNewStu(up.lineEdit.text(), up.lineEdit_2.text(), up.lineEdit_3.text(), up.lineEdit_4.text(),
                          up.lineEdit_5.text()))
    up.pushButton_4.clicked.connect(
        lambda: updateStu(up.lineEdit.text(), SNAME=up.lineEdit_2.text(), SSEX=up.lineEdit_3.text(),
                          SAGE=up.lineEdit_4.text(), SDEPT=up.lineEdit_5.text()))
    up.pushButton_5.clicked.connect(lambda: deletStu(up.lineEdit.text()))
    up.pushButton_6.clicked.connect(lambda: end())
    up.pushButton_7.clicked.connect(lambda: updateTable(up))


# addNewStu("2018217825","周迪",'F',"17","CS")
# updateStu("2019217864",SAGE="20",SSEX="",SDEPT="CS")
# deletStu("2018217825")
# selectCourse('2019217864','1')
# deleteSC("2019217864")

app = QtWidgets.QApplication(sys.argv)
MainWindow = QtWidgets.QMainWindow()
ui1 = ui.Ui_Dialog()
ui1.setupUi(MainWindow)


def infoRaise(str, ui1=ui1):
    ui1.info = ui.info()
    ui1.info.initUI(str)
    ui1.info.show()


events(ui1)
MainWindow.show()
sys.exit(app.exec_())
