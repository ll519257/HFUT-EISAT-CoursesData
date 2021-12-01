/* ---------------------------------------------
   Purpose: This  Program  is Sort Demo
   Author :  Xuan
   Application : Demo
   Time : 2014.3.20
------------------------------------------------*/

#define MAXNUM 50000
#include <stdio.h>
#include <stdlib.h>
#include <dos.h>
#include <time.h>

int iCompare(const void * Argu1,const void* Argu2);

int main(void)
{
	clock_t start, end;
	int  a[MAXNUM],i,j,iPos;

	printf("\n");

	for (i = 0; i < MAXNUM; i++)
	{
		a[i] = rand() % 30000;
		if(i != 0 && i % 10 == 0)
		{
			printf("\n");
		}
		printf("%6d",a[i]);
	}//End of for

	printf("\n-------------------------------------------------------------------------------\n");
/*
	start = clock();
	for (i = 0; i < MAXNUM - 1; i++)
	{
		iPos = i;
		for (j = i + 1; j< MAXNUM;j++)
		{
			if (a[j] > a[iPos])
			{
				iPos = j;
			}
		}//End of for
		if (iPos != i)
		{
			int iTemp;
			iTemp = a[i];
			a[i] = a[iPos];
			a[iPos] = iTemp;
		}//End of if
	}//End of for

	end = clock();

*/
	start = clock();
	qsort((void*)a, MAXNUM, sizeof(int), iCompare);
	end = clock();

    printf("\n-------------------------------------------------------------------------------\n");
	printf("\n");
	for ( i = 0;i < MAXNUM;i ++)
    {
		if ( i != 0 && i % 10 == 0)
		{
			printf("\n");
		}/*End of if*/
		printf("%6d",a[i]);
	}/*End of for*/
	printf("\n所用时间: %7.5fs\n",(float) ( (end - start) / CLK_TCK));

	system("pause");

	return 0;

}

int iCompare(const void * Argu1,const void *Argu2)
{
	return (*(int *)Argu1 >= *(int *)Argu2)?1:-1;
}
