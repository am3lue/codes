#include<stdio.h>
#include<conio.h>
int main(){
FILE *fp;
              int roll;
              char name[25];
              float marks;
              char ch;
              fp = fopen("file.txt","w");        
             do {
                      printf("\nEnter Roll : ");
                      scanf("%d",&roll);
                      printf("\nEnter Name : ");
                      scanf("%s",name);
                      printf("\nEnter Marks : ");
                      scanf("%f",&marks);
                      fprintf(fp,"%d\t %s\t %f",roll,name,marks);
                      printf("\nDo you want to add another data (y/n) : ");
                      ch = getche();
              }while(ch=='y' || ch=='Y');
              printf("\nData written successfully...");
              fclose(fp);

}
