#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define PI 3.141592653589793

int main(void)
{
    int i;
    double dVal;
    FILE *pFile = NULL;

    pFile = fopen("sinlist.bin","wb+");

    for(i = 0; i < 36000; i++)
    {
        dVal = sin((double) i / 100. * PI / 180.);
        //printf("%10.9lf\n",dVal);
        fwrite((void*)&dVal,sizeof (dVal),1,pFile);
    }
    fseek(pFile,3000 * sizeof(dVal),SEEK_SET);

    fread((void*)&dVal,sizeof(dVal),1,pFile);

    printf("%10.9lf\n",dVal);
    fclose(pFile);
    return 0;
}
