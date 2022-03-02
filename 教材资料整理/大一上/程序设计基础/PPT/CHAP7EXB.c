#include <STDIO.H>
#include <STDLIB.H>

int main(void)
{
	int m,n,iSum = 0;
	int i,j;
	int **ipOfArray,*ipBuff;

	printf("以，分隔输入二维矩阵的行数，列数：");
	scanf("%d,%d",&m,&n);

	ipOfArray = (int **)malloc(sizeof(int *) * m);
	ipBuff = (int *)calloc(m, sizeof(int) * n);

	if (ipOfArray == NULL || ipBuff == NULL)
	{
		printf("内存分配错误，程序退出！");
		exit(1);
	}
	for (i = 0; i < m; i++)
	{
		*(ipOfArray + i) = ipBuff + i * n;
	}

    printf("请以空格或回车分隔输入%d×%d矩阵的元素：\n",m,n);
	for (i = 0; i < m; i++)
	{
		for (j = 0; j < n; j++)
		{
			scanf("%d",&ipOfArray[i][j]);
			iSum += ipOfArray[i][j];
		}
	}

	printf("%d×%d矩阵的元素和：%d\n",m,n,iSum);
	free(ipOfArray);
	free(ipBuff);
	return 0;
}
