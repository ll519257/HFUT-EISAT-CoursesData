// 无符号短整型转换为二进制字符串输出。
#include <stdio.h>
#include <stdlib.h>
//#define DEBUG

int main(void)
{
	unsigned short a,sMask;
	unsigned int i,uSizeOfBuf;
	char *szPtr,*szCur;

	uSizeOfBuf = sizeof(a) * 8 + 1;

#ifdef DEBUG
	printf("uSize = %d\n",uSizeOfBuf);
#endif // DEBUG

	szPtr = (char *)malloc(uSizeOfBuf);
	if (szPtr == NULL)
	{
		exit(1);
	}

	szCur = szPtr;
    printf("Please input a hex( <= 4 bit):");
	scanf("%hx",&a);

	sMask = 1 << (uSizeOfBuf - 2);

#ifdef DEBUG
	printf("sMask = %hu\n",sMask);
#endif // DEBUG

	for (i = 0; i < uSizeOfBuf - 1; i++)
	{
		*szCur = (((sMask & a ) != 0) ? '1':'0');
		sMask >>= 1;

#ifdef DEBUG
		putchar(*szCur);
#endif // DEBUG
		szCur++;

	}
	*szCur = '\0';

	puts(szPtr);
	free(szPtr);
	return 0;
}
