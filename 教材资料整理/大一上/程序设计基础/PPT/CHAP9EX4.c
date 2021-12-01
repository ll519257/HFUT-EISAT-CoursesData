
#include <string.h>
#include <stdio.h>
int main(void)
{
   FILE *pFile;
   char msg[] = "This is a test message!",buf[80];
   pFile = fopen("94.txt", "w+");

   fwrite(msg, strlen(msg)+1, 1, pFile);

   fseek(pFile, 0L, SEEK_SET);

   fread(buf, strlen(msg)+1, 1, pFile);
   printf("%s\n", buf);

   fclose(pFile);

   return 0;
}
