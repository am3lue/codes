#include<stdio.h>
// call by value
int sum(int a, int b){
    return a + b;
}

//call by 

int main(){
    // call by value
    int a = 1, b = 3, s;

    s  = sum(a,b);

    printf("The Value of s: %d", s);

    return 0;
}