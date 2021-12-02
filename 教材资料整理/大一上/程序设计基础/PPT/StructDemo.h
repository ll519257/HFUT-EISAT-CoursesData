/*------------------------------------------------
    Filename:StructDemo.h
    Purpose: Define Data struct declear function
             etc.
    Date：2018.4.26
------------------------------------------------*/
#ifndef STRUCTDEMO_H_INCLUDED
#define STRUCTDEMO_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#define DEBUG
#define FILEERROR 1
#define STUNUM  84

struct stu
{
    long lStuID;        //学号
    char szName[20];    //姓名
    char szNCName[20];  //自然班
    char szTCName[20];  //教学班
    char szCoName[20];  //课程名称
    float fScore[4];    //成绩
};

int getData(struct stu *);//Get data from file stinf.csv
void DisplayData(struct stu *,int);//Display data
int iCompare(const void *,const void *);

#endif // STRUCTDEMO_H_INCLUDED
