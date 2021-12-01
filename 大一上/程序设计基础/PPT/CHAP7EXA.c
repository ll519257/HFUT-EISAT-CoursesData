#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	float *fPBuff,fAve =0.0f;
	int i,n,iCount = 0;

	printf("Input n:");
	scanf("%d",&n);

	fPBuff = (float  *)malloc((sizeof (float)) * n);

	if (fPBuff == NULL)
	{
		printf("Malloc error!");
		system("pause");
		return 1;
	}
	printf("Input %d datas:\n",n);

    for (i = 0; i < n; i++)
    {
		scanf("%f",fPBuff + i );

		fAve += *(fPBuff + i);
    }
	fAve /= (float)n;
	for (i = 0; i < n; i++)
	{
		if (fPBuff[i] < fAve)
		{
			iCount++;
		}
	}
	printf("%d:%d\n",n,iCount);
	free(fPBuff);
	return 0;
}
