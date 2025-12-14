#include <stdio.h>  

void main() {
    int i, term;  

    printf("Input number of terms : ");  
    scanf("%d", &term);  

    for (i = 1; i <= term; i++) {  
        printf("Number is : %d and cube of the %d is :%d \n", i, i, (i * i * i));  
    }
}