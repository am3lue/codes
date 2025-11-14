#include<stdio.h>

int fact(int n){
    int factorial = 1;
    for(int i = 1; i <= n; i++){
        factorial *= i;
    }
    printf("The factorial is: %d", factorial);

}

int sum (int a, int b){
    return a + b;
}
int main(){
    printf("Enter a number: ");
    int num;
    scanf("%d", &num);

    fact(num);
    int a , b;
    printf("\nPlease Enter two numbers to find its sum: ");
    scanf("%d %d", &a ,&b);

    printf("The sum of %d and %d is: %d\n", a,b ,sum(a,b));
    return 0;

}