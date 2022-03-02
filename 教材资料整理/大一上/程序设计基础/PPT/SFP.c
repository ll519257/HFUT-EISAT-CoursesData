#include<stdio.h>
struct  stu{
             long  num ;
             char  name[20];
             float score ;
            };
struct  stu  *findp (long,struct stu*);
int main(void)
{
    struct stu sa[] = {
                        {99010101 , "Fun"  ,  89.0f},
                        {99010102 , "Zhang" , 99.0f},
                        { 99010103 , "Wang" , 78.0f},
                        { 0 , "\0" , 0.f}
                      };

    struct stu *p;
    long  lsanum ;
    printf("Please Input a num:");
    scanf("%ld", &lsanum);
    p = findp(lsanum,sa) ;
    if (p == NULL)
    {
        printf ("not found!\n") ;
    }
    else
    {
        printf ("%10ld%10s%7.1f\n",p -> num,p -> name,p -> score);
    }
     return 0;
}

struct stu *findp (long number,struct stu *sa)
{
    struct stu *p = NULL;
    int i;
    for(i = 0;sa[i].num != 0; i++)
    {
        if(sa[i].num == number)
        {
            p = &sa[i];
            break ;
        }
    }
    return  p ;
}
