//选择排序
#include  <stdio.h>

int main(void)
{
    int a[10] = {4, 3, 5, 1, 10, 12, 2, 6, 7, 9}, iTemp;
    int i, j, iPos;

    for (i = 0; i < 9 ;i++)
    {
        iPos = i;
        for (j = i + 1; j < 10; j++)
        {
            if (a[j] < a[iPos])
            {
                iPos = j;
            }
        }//遍历记录最小值位置
        if (iPos != i )
        {
            iTemp = a[i];
            a[i] = a[iPos];
            a[iPos] = iTemp;
        }
    }

    for (i = 0; i < 10; i++)
    {
        printf("%4d", a[i]);
    }

    return 0;
}
