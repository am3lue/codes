
#include<stdio.h>
// call by reference
int sum(int *x, int *y){
    *x = *x + *y;
}



int main(){
    // call by value
    int a = 1, b = 3;

    // sum(&a,&b);
    a = a + b;

    printf("The Value of s: %d", a);

    return 0;
}