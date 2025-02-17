# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'Remove.ui'
#
# Created by: PyQt5 UI code generator 5.15.1
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QFileSystemModel, QTreeView, QWidget, QVBoxLayout
from PyQt5.QtGui import QIcon
import sys
import LineNumber
import webbrowser
import hightest
import time
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
import os
import threading
from PyQt5.QtWidgets import QFileDialog, QDialog
from PyQt5 import QtCore
from PyQt5.QtGui import QKeySequence
import find
import Linus
import getpass
import Add_core
import term
import QTerminal2
class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        
        MainWindow.resize(313, 178)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.widget = QtWidgets.QWidget(self.centralwidget)
        self.widget.setGeometry(QtCore.QRect(0, 0, 791, 351))
        self.widget.setObjectName("widget")
        self.comboBox = QtWidgets.QComboBox(self.widget)
        self.comboBox.setGeometry(QtCore.QRect(0, 30, 311, 41))
        self.comboBox.setCurrentText("Select Core")
        file = open("Core.txt", "r")
        self.comboBox.addItem(QIcon("icons8-microchip-100.png"),"Select Core")
        data = file.read().splitlines()
        for i in data:
            s=i.split(',')
            if i == "":
                pass
            elif s[1] == "Verilog":
                self.comboBox.addItem(QIcon("Verilator_logo.png"),s[0])
            elif s[1] == "Chisel":
                self.comboBox.addItem(QIcon("icons8-nail-100.png"),s[0])
        file.close()
        self.comboBox.setObjectName("comboBox")
        self.label = QtWidgets.QLabel(self.widget)
        self.label.setGeometry(QtCore.QRect(0, 10, 231, 17))
        self.label.setObjectName("label")
        self.pushButton = QtWidgets.QPushButton(self.widget)
        self.pushButton.setGeometry(QtCore.QRect(220, 150, 89, 25))
        self.pushButton.setObjectName("pushButton")
        self.pushButton.clicked.connect(self.remove)
        MainWindow.setCentralWidget(self.centralwidget)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Remove Core"))
        self.label.setText(_translate("MainWindow", "Select Which Core to be Removed"))
        self.pushButton.setText(_translate("MainWindow", "Remove"))

    def remove(self):
        core=self.comboBox.currentText()
        if core=="Chisel":
            popup = QtWidgets.QMessageBox(MainWindow)
            popup.setIcon(QtWidgets.QMessageBox.Warning)
            popup.setText("This is a default Core and Can't be Removed")
            popup.setStandardButtons(QtWidgets.QMessageBox.Ok)
            popup.setDefaultButton(QtWidgets.QMessageBox.Ok)
            answer = popup.exec_()
        elif core=="BuraqSV32i":
            popup = QtWidgets.QMessageBox(MainWindow)
            popup.setIcon(QtWidgets.QMessageBox.Warning)
            popup.setText("This is a default Core and Can't be Removed")
            popup.setStandardButtons(QtWidgets.QMessageBox.Ok)
            popup.setDefaultButton(QtWidgets.QMessageBox.Ok)
            answer = popup.exec_()
        elif core=="Select Core":
            popup = QtWidgets.QMessageBox(MainWindow)
            popup.setIcon(QtWidgets.QMessageBox.Information)
            popup.setText("Select a Core!!")
            popup.setStandardButtons(QtWidgets.QMessageBox.Ok)
            popup.setDefaultButton(QtWidgets.QMessageBox.Ok)
            answer = popup.exec_()
            
        else:
            popup = QtWidgets.QMessageBox(MainWindow)
            popup.setIcon(QtWidgets.QMessageBox.Information)
            popup.setText("This Core "+core+" has been Removed")
            popup.setStandardButtons(QtWidgets.QMessageBox.Ok)
            popup.setDefaultButton(QtWidgets.QMessageBox.Ok)
            answer = popup.exec_()
            index = self.comboBox.findText(core)  # find the index of text
            self.comboBox.removeItem(index)
            d=open("Core Name.txt","w")
            d.write(core)
            d.close()
            file = open("Core.txt", "r")
            data = file.read().splitlines()
            for i in data:
                s=i.split(',')
                if i == "":
                    pass
                elif s[0] ==core:
                    b=""
                    for i in range (len(s)):
                        b+=s[i]
                        if i!=(len(s)-1):
                            b+=","
                    print(b)
                    file.close()
                    file2=open("Core.txt", "rt")
                    lines=file2.readlines()
                    file2.close()
                    new_file=open("Core.txt", "wt")
                    for line in lines:
                        if line.strip("\n")!=b:
                            new_file.write(line)
                    print(new_file)
                    new_file.close()
            
import sys
import resource_rc
app = QtWidgets.QApplication(sys.argv)

    
MainWindow = QtWidgets.QMainWindow()
    
ui = Ui_MainWindow()
ui.setupUi(MainWindow)
MainWindow.show()
sys.exit(app.exec_())
