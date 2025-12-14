#include <stdio.h>

int main() {
    int x = 50;     // a normal variable
    int *p;         // pointer variable

    p = &x;         // store address of x in pointer p

    printf("Value of x          = %d\n", x);
    printf("Address of x        = %p\n", &x);

    printf("\nValue of p (address stored in p) = %p\n", p);
    printf("Address of p        = %p\n", &p);

    printf("\nValue pointed by p (value of x)  = %d\n", *p);

    return 0;
}
