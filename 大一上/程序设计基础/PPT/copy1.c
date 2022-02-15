#include <stdio.h>
#include <STDLIB.H>

int main ( int argc,char  *argv[ ])
{
	char chVal;
	FILE  *pFileIn , *pFileOut ;
	if (argc != 3)
	{
		printf("Command format error!\n");
		system("Pause");
		exit(1);
	}

	if (( pFileIn = fopen(argv[1] , "r" )) == NULL )
	{
		printf ("Cannot  open  the  source file \n");
		system("pause");
		exit(2) ;
	}

	if (( pFileOut = fopen (argv[2] , "w" )) == NULL )
	{
		printf ("cannot  open  the destination file \n");
		system("pause");
		exit(3) ;
	}
	chVal = fgetc(pFileIn);
	while (feof(pFileIn) == 0)
    {
	    fputc (chVal , pFileOut);
        chVal = fgetc(pFileIn);
	}

	fclose (pFileIn);
	fclose (pFileOut);
	return 0;
}
