#include<stdio.h>
#include<stdlib.h>
int main()
            {
              FILE *fp;
              int roll;
              float marks;
              char name[30];
              //fp = fopen("fprintffile.txt","r+");
              fp= fopen("file.txt","r");
	           if(fp == NULL)                                                                                       
              {
                     printf("\nCan't open file or file doesn't exist.");
                     exit(0);       //SUCCESS -> Program ends normally
              }
              printf("\nData in file...\n");
              while((fscanf(fp,"%d%s%f",&roll,name,&marks))!=EOF)
              {
                   printf("\n%d\t %s\t %f",roll,name,marks);
              }

              fclose(fp);
              return 0;
}
