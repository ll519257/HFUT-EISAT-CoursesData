#include <stdio.h>
int main(void)
{
   FILE *pFile;
   pFile = fopen("DUMMY.FIL", "w");
   fgetc(pFile);
   if (ferror(pFile))
   {
      printf("Error reading from DUMMY.FIL\n");
      clearerr(pFile);
   }
   fclose(pFile);
   return 0;
}
