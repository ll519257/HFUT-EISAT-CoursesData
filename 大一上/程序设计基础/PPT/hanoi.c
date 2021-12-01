#include <stdio.h>
void moveHanoi(int,char,char,char);
int main(void)
{
    int n;
    printf("Please input number:");
    scanf("%d",&n);
    moveHanoi(n,'A','B','C');
    return 0;
}

void moveHanoi(int n,char chSouPost,char chDesPost,char chAuxPost)
{
    if (n == 1)
    {
        printf("Move disk %2d from %c to %c\n",n,chSouPost,chDesPost);
    }
    else
    {
        moveHanoi(n - 1,chSouPost,chAuxPost,chDesPost);
        printf("Move disk %2d from %c to %c\n",n,chSouPost,chDesPost);
        moveHanoi(n - 1,chAuxPost,chDesPost,chSouPost);
    }
}
