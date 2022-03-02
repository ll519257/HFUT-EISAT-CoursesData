#include <stdio.h>
#include <time.h>

void Delay1s(int);
void Bell(void);

int main(void)
{
    int i;

    printf("%d\n",CLK_TCK);
    for (i = 0; i < 10; i++)
    {
        Delay1s(5);
        printf("[R ");
        Bell();
        Delay1s(5);
        printf("G]\n");
        Bell();
    }

}

void Delay1s(int n)
{
    clock_t start;
    int i;

    for(i = 0; i < n; i++)
    {
        start = clock();
        while((clock() - start) < CLK_TCK)
        {
            ;
        }
    }
}

void Bell(void)
{
    printf("\007");
}
