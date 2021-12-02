/*--------------------------------------------------------/
					cyclic shift  test
/--------------------------------------------------------*/
#include <STDIO.H>

int main(void)
{
	unsigned  num1,num2,left,righ,n;

	printf("输入8位16进制数:");
	scanf("%x",&num1);             /* 输入移位数据 */

	printf("输入循环右移位数:");
	scanf("%d",&n);                /* 输入移位位数 */

	righ = num1 << (sizeof (unsigned) * 8 - n); /* 取原数的右端n位，右边补0 */
	left = num1 >> n;              /* 取原数的左端32-n位，左边补0 */

	num2 = left | righ;            /* 将2个数据重新组合为新数据 */

	printf("num1=%xH\n",num1);     /* 输出num1 */
	printf("num2=%xH\n",num2);     /* 输出num2 */

	return 0;
}
