import socket
import clientui
import sys
from PyQt5 import QtCore, QtGui, QtWidgets
import RC4
key = "infosystest"

def end(client, ui):
    client.close()
    sys.exit()

def messageEntryShowAndSend(ui,client):
    a = RC4.rc4Entry(ui.textEdit.toPlainText(), key)
    ui.textEdit_2.setText(a)
    client.send(a.encode())

MaxBytes = 1024 * 1024
port = 11223
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.settimeout(30)
app = QtWidgets.QApplication(sys.argv)
MainWindow = QtWidgets.QMainWindow()
ui = clientui.Ui_clientui()
ui.setupUi(MainWindow)
ui.lineEdit.setText('127.0.0.1')
ui.pushButton_3.clicked.connect(lambda: client.connect((ui.lineEdit.text(), port)))
ui.pushButton.clicked.connect(lambda:messageEntryShowAndSend(ui,client))
ui.pushButton_2.clicked.connect(lambda: end(client))
MainWindow.show()
sys.exit(app.exec_())
