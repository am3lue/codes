#include<stdio.h>

typedef char string[100];
int main(){
    int marks, total = 0, count = 0;
    printf("Please enter marks greater than 0 to continue \n");
    do{
        printf("Enter Marks: ");
        scanf("%d", &marks);
        total += marks;
        count++;

    }
    while(marks > 0);
    printf("The sum is: %d, The average is: %d", total, total / count);
    return 0;
}