#include <STDIO.H>
#include <STDLIB.H>

#define  N 5

struct student
{
	long lNum;
	char name[20];
	float fScore[3];
	float fAve;
	float fSum;
};


int main(void)
{
	struct student stBuff[N],stTmp;
	FILE *pFileIn,*pFileOut;
	int i,j;

	pFileIn = fopen("Stus.txt","r");
	if (pFileIn == NULL)
	{
		printf("Source file open error!");
		exit(1);
	}
	for (i = 0; i < N; i++)
	{
		fscanf(pFileIn,"%ld%s%f%f%f",&stBuff[i].lNum,stBuff[i].name,
               stBuff[i].fScore,stBuff[i].fScore + 1,stBuff[i].fScore + 2);

		stBuff[i].fSum = stBuff[i].fScore[0] + stBuff[i].fScore[1] + stBuff[i].fScore[2];
		stBuff[i].fAve = stBuff[i].fSum / 3.0f;
	}

	for (i = 0;i < N - 1; i++)
	{
		for (j = i + 1; j < N ; j++)
		{
			if (stBuff[i].fSum < stBuff[j].fSum)
			{
				stTmp = stBuff[i];
				stBuff[i] = stBuff[j];
				stBuff[j] = stTmp;
			}

		}
	}

	pFileOut = fopen("Stud.txt","w");
	if (pFileOut == NULL)
	{
		printf("Destination file open error!");
		fclose(pFileIn);
		exit(2);
	}

	for (i = 0; i < N; i++)
	{
		fprintf(pFileOut,"%ld %s",stBuff[i].lNum,stBuff[i].name);
		for (j = 0; j < 3; j++)
		{
			fprintf(pFileOut,"%7.1f\t",stBuff[i].fScore[j]);
		}
		fprintf(pFileOut,"%7.1f%7.1f\n",stBuff[i].fAve,stBuff[i].fSum);
		//printf("%d\n", ftell(pFileOut));
	}

	fclose(pFileIn);
	fclose(pFileOut);

	return 0;
}
