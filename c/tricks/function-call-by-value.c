#include<stdio.h>
void swap(int a, int b); // function prototype, also called function declaration
void main()
{
	int m = 22, n = 44;
	printf(" values before swap m = %d  and n = %d", m, n);
    swap(m, n); //call by value
	printf(" \nvalues after swap m = %d and n = %d", m, n);
    
}

void swap(int m, int n)
{ 
 int tmp;
 tmp = m;
 m = n;
 n = tmp;
printf(" \nvalues after swap m = %d and n = %d", m, n);
}

