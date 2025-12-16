#include<stdio.h>

int po(int base, int exp){
    int result = 1;
    for(int i = 0; i < exp; i++){
        result = result * base;
    }
    return result;
}
int count(int n){
    int sum = 0;
    while(n != 0){
        sum++;
        n = n / 10;
    }
    return sum;
}

int check(int n){
    int size = count(n);

    int sum = 0;

    while(n != 0){
        int i = n % 10;
        sum = po(i , size) + sum;
        n = n / 10;
        printf("%d ", sum);
    }
    return sum;
}

int main(){
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    printf("Number of digits: %d\n", count(n));
    printf("Sum of digits raised to power of number of digits: %d\n", check(n));
    printf("Checking for Armstrong Number:%d\n", n ^3);
    if(n == check(n)){
        printf("Armstrong Number\n");
    } else {
        printf("Not an Armstrong Number\n");
    }
}