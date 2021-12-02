#include <stdio.h>
#include <stdlib.h>
#define   SIZE 256

int  main(void)
{
	char  buff[SIZE],szFileName[80];
	FILE  *pFileIn,*pFileStdout,*pFileOut;

	pFileStdout = stdout ;

	printf("请输入文件名：");
	gets(szFileName);

	if((pFileIn = fopen(szFileName, "r" )) == NULL )
    {
		printf ( "Source file open error!\n"  );
		system("pause");
		exit (1);
    }

	if ((pFileOut = fopen("a1.txt", "w" )) == NULL)
	{
		fclose(pFileIn);
		printf ( "Destination file open error!\n"  );
		system("pause");
		exit (2);
	}
	printf("文件内容：\n");
	while (fgets (buff , SIZE , pFileIn) != NULL )
	{
        fputs(buff,pFileStdout);
		fputs(buff,pFileOut);
    }
	printf("\n");

	pFileStdout = NULL;
	fclose(pFileIn);
	fclose(pFileOut);

	return 0;
}
