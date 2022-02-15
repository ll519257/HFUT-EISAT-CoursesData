#include<stdio.h>
#include<stdlib.h>

#define  N  5
struct  student
{
	char  szName[10] ;
    long  lID ;
    int iScore ;
};


int  main (void)
{
	int  i,iNum;
	FILE  *pFileSource;
	struct  student stud[N],stTmp;
	pFileSource = fopen("std.lst", "wb+");
	if (pFileSource == NULL)
	{
		exit(1);
	}
	for (i = 0; i < N; i++)
	{
		printf("输入第%d个人的姓名：",i+1);
		gets(stud[i].szName);
		fflush(stdin);
		printf("输入第%d个人的学号：",i+1);
		scanf("%ld",&stud[i].lID);
		fflush(stdin);
		printf("输入第%d个人的成绩：",i+1);
		scanf("%d",&stud[i].iScore);
		fflush(stdin);
		fwrite((void *)(stud + i),sizeof(struct student),1,pFileSource);
	}
    rewind(pFileSource);

	for (i = 0; i < N; i++)
	{
		fread (&stTmp, sizeof (struct  student ), 1 , pFileSource);
		printf("姓名：%s\t学号：%ld\t成绩：%d\n",stTmp.szName,stTmp.lID,stTmp.iScore);
	}

	printf("输入序号：1到%d :",N);
    scanf("%d",&iNum);
	fseek( pFileSource, (iNum - 1)*sizeof( struct  student ) ,SEEK_SET);
	fread (&stTmp, sizeof (struct  student ), 1 , pFileSource);
	printf("姓名：%s\t学号：%ld\t成绩：%d\n",stTmp.szName,stTmp.lID,stTmp.iScore);

	fclose(pFileSource) ;

	return 0;
}
