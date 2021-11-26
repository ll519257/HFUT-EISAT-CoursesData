import socket
import time
import RC4
import sys
import serverui
from PyQt5 import QtCore, QtGui, QtWidgets
import pymysql
import _thread

MaxBytes = 1024 * 1024
key = "infosystest"
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.settimeout(60)
# host = socket.gethostname()
port = 11223
# server.listen(5)  # 监听
db = pymysql.connect(host="localhost", user="root", password="", database="INFOQ3")# 自己的密码，数据库
cursor = db.cursor()
serveron = False

def endServer(server):
    db.close()
    server.close()
    sys.exit()

def updateTable(ui):
    cursor.execute("SELECT * FROM TCP")
    res = cursor.fetchall()
    ui.table.setRowCount(len(res))
    for i in range(len(res)):
        for j in range(len(res[i])):
            ui.table.setItem(i, j, QtWidgets.QTableWidgetItem(str(res[i][j])))

def serverOn(ui):
    global serveron,server
    server.bind((ui.lineEdit.text(), port))  # 绑定端口
    server.listen(5)  # 监听
    serveron = True


def close():
    global serveron,server
    server.close()
    serveron = False

def treadTCP(ui):
    global serveron,server,cursor,db
    while True:
        client, addr = server.accept()  # 等待客户端连接
        print(addr, " 连接上了")
        while serveron:
            ""
            data = client.recv(MaxBytes)
            if not data:
                print('数据为空，我要退出了')
                break
            localTime = time.asctime(time.localtime(time.time()))
            # print(type(data))
            # print(localTime, ' 接收到数据字节数:', len(data))
            msg = RC4.rc4Detry(data.decode(), key)
            print("INSERT INTO TCP VALUES (\'" + str(localTime) + "\',\'" + addr[0] + "\',\'" + msg + "\')")
            cursor.execute(
                "INSERT INTO TCP VALUES (\'" + str(localTime) + "\',\'" + addr[0] + "\',\'" + msg + "\')")
            db.commit()
            updateTable(ui)



app = QtWidgets.QApplication(sys.argv)
MainWindow = QtWidgets.QMainWindow()
ui = serverui.Ui_serverui()
ui.setupUi(MainWindow)
ui.lineEdit.setText("127.0.0.1")
ui.pushButton.clicked.connect(lambda: serverOn(ui))
ui.pushButton_2.clicked.connect(lambda: endServer(server))
ui.pushButton_3.clicked.connect(lambda: endServer(server))
MainWindow.show()
_thread.start_new_thread(treadTCP,(ui,))
_thread.start_new_thread(sys.exit,(app.exec_(),))


