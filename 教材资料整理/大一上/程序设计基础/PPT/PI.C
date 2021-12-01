/********************************************************************
	created:	2019/03/22
	created:	22:3:2019   9:46
	filename: 	PI.C
	file path:	D:\CAIWorkSpace\2018~2019第二学期教学文档\CCAI14FIN
	file base:	PI
	file ext:	C
	author:		Xuan

	purpose:    本程序用于输入精度并计算圆周率统计计算时间
*********************************************************************/


#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(void)
{
	clock_t start, end;
	double dItem,dPi,dPrecision,dSign;
	long long llCount=0;

	printf("请输入运算精度:");
	scanf("%lf",&dPrecision);
    dItem = 1.0;
    dPi = 0.0;
    dSign = 1.0;

	start = clock();
	do
	{
		dPi += 1.0 / dItem * dSign;
		dItem += 2.;
		dSign = -dSign;
		llCount ++;
	}while(1. / dItem  > dPrecision / 4.);
	end = clock();

	printf("\n圆周率 = %15.13lf\n计算次数 = %llu",4.0 * dPi,llCount);
	printf("\n运算耗时: %7.3fs\n",(float)((end - start)/ CLK_TCK));

	system("pause");
	return 0;
}
