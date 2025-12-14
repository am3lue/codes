#include<stdio.h>
#include<string.h>
 void main()								
 {									
 char a[80],n[80];							
 printf("\n Enter a string for a:");					
 gets(a);	
 printf("\n Enter a string for n:");					
 gets(n);							
 strcpy(n,a);
 printf("\nString after copying:");
 puts(n);
 }
