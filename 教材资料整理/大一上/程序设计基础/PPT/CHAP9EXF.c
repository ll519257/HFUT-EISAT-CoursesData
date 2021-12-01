
#include "my.h"

int main(void)
{
  /*定义结构体指针，用于指向动态分配内存的首地址*/
	STUDENTINF  *pStru;
  /*定义文件指针*/
	FILE  *pFile;
    int  i;
	int  iNum;			/*存放人数*/
	int  iFunIndex;     /*存放选择主功能编码*/
	int  iSubIndex;     /*存放选择子功能编码*/
	int  iScoreSel;     /*选择的课程*/
    long lNumSearch;    /*存放查询输入的学号*/
    char szTemp[10];    /*临时字符数组用于存放输入字符串*/
    int  iScoreSeg[5];  /*存放各分数段人数数组*/
    /*主循环*/
    do{
		 /*调用用户界面，返回主功能编码*/
		iFunIndex = UserSel();
        system("cls");           /*清屏*/
        switch(iFunIndex)
		{
		case DATAINPUT:  /*数据输入功能*/
			printf("开始输入：\n");
            printf("请输入学生人数:  ");
		    gets(szTemp);
            iNum = atoi(szTemp);

		    if((pFile = fopen("stuinfo.dat","w")) == NULL)
			{
                printf("文件打开失败，系统退出！");
				exit(1);
            }/* end if*/

            fwrite(&iNum,sizeof iNum,1,pFile);/*人数写入文件*/
					 /*为数据动态分配内存*/
			pStru = (STUDENTINF *)malloc(iNum * sizeof(STUDENTINF));
			if(pStru == NULL)
			{
				printf("内存分配失败，系统退出！");
				exit(1);
			}
			for(i = 0; i < iNum; i++)
			{
				InputMessage(pStru + i);   /*循环输入数据*/
			}
           /*写入磁盘文件*/
			fwrite(pStru,sizeof(STUDENTINF),iNum,pFile);

			for(i=0; i < iNum; i++)
			{
				PrintMessage(pStru + i);
			}

			fclose(pFile);
            free(pStru);
			system("pause");
            break; /*输入功能结束*/

        case DATAMODIF:  /*按学号修改数据*/
            if((pFile = fopen("stuinfo.dat","r+"))==NULL)
			{
                printf("文件打开错误，系统退出！");
				exit(1);
			}

            fread(&iNum,sizeof iNum,1,pFile);

            pStru = (STUDENTINF *)malloc(iNum * sizeof(STUDENTINF));
            if(pStru == NULL)
            {
                printf("内存分配失败，系统退出！");
				exit(1);
            }
            fread(pStru,sizeof(STUDENTINF),iNum,pFile);

            printf("请输入需要修改数据学生的学号:");
            gets(szTemp);
            lNumSearch = atol(szTemp);

            for(i = 0 ;i < iNum; i++)
            {
                if(lNumSearch == pStru[i].lId)
                {
                    break;
                }
            }
            if(i < iNum)
            {
                InputMessage(pStru + i);
            }
            else
            {
                printf("无此学号\n");
            }
            rewind(pFile);
            fwrite(&iNum,sizeof iNum,1,pFile);
            fwrite(pStru,sizeof(STUDENTINF),iNum,pFile);


            for(i=0;i < iNum; i++)
            {
                PrintMessage(pStru + i);
            }
            fclose(pFile);
            free(pStru);
            system("pause");
            break;

        case MANAGFUN:   /*成绩管理选择*/

		    printf("选择需要的操作:\n");
            iSubIndex = MangSel( );
            if((pFile = fopen("stuinfo.dat","r+"))==NULL)
            {
                printf("数据文件错误，先选择第一项输入后重试，系统退出！");
                exit(1);
            }
            fread(&iNum,sizeof (iNum),1,pFile);

		    pStru = (STUDENTINF *)malloc(iNum*sizeof(STUDENTINF));
		    if(pStru == NULL)
		    {
			    printf("内存分配失败，系统退出！");
                exit(1);
		    }

    	    fread(pStru,sizeof(STUDENTINF),iNum,pFile);

            switch(iSubIndex)
            {
            case SCORSTAT:  /*统计所选课程各个分数段的人数*/
                printf("输入需要统计的课程,1、2别为两门课程，3是平均分数:");
                gets(szTemp);
                iScoreSel = atoi(szTemp)-1;
                StatiScore(pStru,iScoreSel,iScoreSeg,iNum);

                if(iScoreSel > 0&& iScoreSel <2)
                {
                    printf("第%d门课程各分数段的人数：\n",iScoreSel+1);
                    printf("90分以上人数：  \t%-5d\n",iScoreSeg[0]);
                    printf("80分到89分人数：\t%-5d\n",iScoreSeg[1]);
                    printf("70分到79分人数：\t%-5d\n",iScoreSeg[2]);
                    printf("60分到69分人数：\t%-5d\n",iScoreSeg[3]);
                    printf("不及格人数：    \t%-5d\n",iScoreSeg[4]);
                }
                else
                {
                    printf("平均成绩各分数段的人数：\n");
                    printf("90分以上人数：  \t%-5d\n",iScoreSeg[0]);
                    printf("80分到89分人数：\t%-5d\n",iScoreSeg[1]);
                    printf("70分到79分人数：\t%-5d\n",iScoreSeg[2]);
                    printf("60分到69分人数：\t%-5d\n",iScoreSeg[3]);
                    printf("不及格人数：    \t%-5d\n",iScoreSeg[4]);

                }
                break;
            case SCORSORT:  /*对所选课程排序*/
                printf("输入需要排序的课程编号1、2、3:\t");
                gets(szTemp);
                iScoreSel = atoi(szTemp)-1;
                SortScore(pStru,iScoreSel,iNum);
                for(i = 0; i < iNum; i++)
                {
                    PrintMessage(pStru + i);
                }

                break;

            case SCORSEAR: /*对输入学号查询*/
                printf("输入需要查找的学号:\t");
                gets(szTemp);
                lNumSearch = atol(szTemp);
                for(i = 0;i < iNum; i++)
                {
                    if(lNumSearch == pStru[i].lId)
                    {
                        break;
                    }
                }
                if(i < iNum)
                {
                    PrintMessage(pStru + i);
                }
                else
                {
                    printf("无此学号");
                }

            }
            fclose(pFile);
            free(pStru);
            system("pause");
            break;
        case EXIT:
            exit(0);       /*退出系统*/
        }
    }while(iFunIndex != EXIT);/*End of  do循环显示主界面用户*/

}

/*---------------------------------------------
/   函数名：UserSel
/   作  用：用户主选择界面
/   参  数：无
/   返回值：用户选择功能整形，范围1~4
/--------------------------------------------*/
int UserSel(void)
{
  char  szBuff[3];

  do{
      system("cls");
	  printf("-------------欢迎使用本系统--------------\n");
      printf("\t1:输入原始成绩数据\n");
      printf("\t2:输入学号，修改数据\n");
      printf("\t3:成绩管理\n" );

      printf("\t4:退出系统\n" );

      printf("\n请选择(1~4):");
      gets(szBuff);

      if(szBuff[0] > '4' || szBuff[0] < '1')
         Bell();
      else
         break;

    }while(szBuff[0] > '4' || szBuff[0] < '1');

    return szBuff[0]-'0';
}

/*---------------------------------------------
/   函数名：InputMessage
/   作  用：输入一个学生的信息
/   参  数：指向STUDENTINF的指针
/   返回值：无
/--------------------------------------------*/
void  InputMessage(STUDENTINF *p)
{
    char  strTmp[15];
    int  i,sum=0;

    printf("请输入学号:");
    gets(strTmp);
    p->lId = atol(strTmp);
    printf("请输入姓名:");
    gets(p -> strName);

    for(i = 0;i < 2; i++)
    {
        printf("请输入第 %d 门课的成绩：",i + 1);
        gets(strTmp);
        p -> iScore[i] = atoi(strTmp);
        sum += p -> iScore[i];
    }
    p -> iScore[2] = (int)((double)sum/2 + 0.5);
 }

/*---------------------------------------------
/   函数名：MangSel
/   作  用：成绩管理功能选择
/   参  数：无
/   返回值：用户选择数据，整形，范围1~3
/--------------------------------------------*/
int MangSel(void)
{
    char  szBuff[3];
    do{
        system("cls");
        printf("------------成绩管理------------\n");
        printf("\t1:统计各个分数段的人数\n");
        printf("\t2:对所选课程排序\n");
        printf("\t3:输入学号后查找\n" );

        printf("请输入选择(1~3):");
        gets(szBuff);
        if(szBuff[0] > '3' || szBuff[0] < '1')
        {
            Bell();
        }
        else
        {
            break;
        }


    }while(szBuff[0] > '3' || szBuff[0] < '1');

    return szBuff[0]-'0';
}

/*---------------------------------------------
/   函数名：StatiScore
/   作  用：统计各个分数段人数
/   参  数：pStu，指向STUDDENTINF的指针，传递成绩结构的首地址
/           pScore，指向整型的指针，传递各个分数数组的首地址
/           iSelCore，整型，传递所选课程
/           iNum,整型,传递人数
/   返回值：无
/--------------------------------------------*/
void StatiScore(STUDENTINF *pStu,int iSelScore,int *pScore,int iNum)
{
    int i;
    for(i = 0; i < 5 ; i++)
    {
        pScore[i]=0;
    }

    for(i = 0; i < iNum; i++)
    {
        if((pStu+i)->iScore[iSelScore] >= 90)
        {
            pScore[0]++;
        }
        else if((pStu+i)->iScore[iSelScore] >= 80)
        {
            pScore[1]++;
        }
        else if((pStu+i)->iScore[iSelScore] >= 70)
        {
            pScore[2]++;
        }
        else if((pStu+i)->iScore[iSelScore] >= 60)
        {
            pScore[3]++;
        }
        else
        {
            pScore[4]++;
        }
    }

}

/*---------------------------------------------
/   函数名： SortScore
/   作  用： 对选定课程排序
/   参  数： pStu，指向STUDDENTINF的指针，传递成绩结构的首地址
/            iSelCore，整型，传递所选课程
/            iNum,整型,传递人数.
/   返回值： 无
/--------------------------------------------*/
void SortScore(STUDENTINF *pStu,int iSelScore,int iNum)
{
    int i,j,iMaxPos;
    STUDENTINF  Temp;
    for(i = 0; i < iNum - 1; i++)
    {
        iMaxPos = i;
        for(j = i + 1;j < iNum; j++)
        {
            if((pStu+iMaxPos)->iScore[iSelScore]<(pStu+j)->iScore[iSelScore])
			{
				 iMaxPos = j;
			}
        }
        if(iMaxPos != i)
        {
            Temp = *(pStu+i);
            *(pStu+i) = *(pStu+iMaxPos);
            *(pStu+iMaxPos) = Temp;
        }
    }
}

/*---------------------------------------------
/   函数名：PrintMessage
/   作  用：输出选定学生的信息
/   参  数：pStu，指向STUDDENTINF的指针，传递结构地址
/
/   返回值：无
/--------------------------------------------*/
void PrintMessage(STUDENTINF *pStu)
{
    printf("学号:%-8d 姓名：%-8s   两门课程成绩：%-4d %-4d  平均成绩：%-4d\n",
            pStu->lId, pStu->strName,pStu->iScore[0],pStu->iScore[1],pStu->iScore[2]);
}

/*---------------------------------------------
/   函数名：Bell
/   作用：  输入错误提示
/   参数：  无
/   返回值：无
/--------------------------------------------*/
void Bell(void)
{
    printf("\007");
}
