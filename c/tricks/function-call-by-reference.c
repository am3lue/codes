#include<stdio.h>
void swap(int *, int *);      // function prototype, also called function declaration
void main()
{
    int m = 22, n = 44;
    printf("values before swap m = %d and n = %d",m,n);
    swap(&m, &n);           //  calling swap function by reference
    printf("\n values after swap m = %d and n = %d", m, n);

}
void swap(int *a, int *b)
{
    int tmp;
    tmp = *a;
    *a = *b;
    *b = tmp;
    printf("\n Swap function values after swap a = %d and b = %d", *a, *b);
}

