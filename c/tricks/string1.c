#include<stdio.h>
 void main()
 {
    char name[20];
    printf("\n Enter the name of the person:");
    //scanf("%s",name);
    gets(name);
    printf("\n The entered name was: %s",name);
}



