#include <stdio.h>
#include <stdlib.h>
int main (void)
{
	char  s[80] ;
	int   a,i;
	FILE  *pFileIn ;

	if ((pFileIn = fopen ("f1.txt" , "r")) == NULL)
	{
		printf ("cannot  open  file" ) ;
		exit (1) ;
    }
    for (i = 0; i < 10; i++)
    {
        fscanf ( pFileIn , "%s%d" , s,&a) ;
	    printf ( "%s\t%d\n", s,a );
    }

    fclose(pFileIn);

    return 0;

}
