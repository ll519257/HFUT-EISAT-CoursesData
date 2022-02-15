#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define M 5

struct namelist{
    char name[20];
};
typedef struct namelist NAME,*NAMEP;
int main(void)
{
    NAME stMyName[M],temp;
    NAMEP p;
    int i,j;

    for(p = stMyName; p < stMyName + M; p++)
    {
        gets(p -> name);
    }

    for (i = 0;i < M - 1; i++)
    {
        for(j = i + 1; j < M; j++)
        {
            if(strcmp(stMyName[j].name,stMyName[i].name) < 0)
            {
                temp = stMyName[i];
                stMyName[i] = stMyName[j];
                stMyName[j] = temp;
            }
        }
    }

    for(i = 0; i < M; i++)
    {
        puts(stMyName[i].name);
    }
    system("pause");
    return 0;
}
