#include<stdio.h>

int main(){
    int sum = 0, count = 0;
    printf("Enter numbers to sum. Type 'n' to stop.\n");
    char choice = 'y';
    while (choice == 'y' || choice == 'Y')
    {
        int n;
        scanf("%d", &n);
        sum += n;
        printf("Do you want to continue (y/n): ");
        scanf(" %c", &choice);
        count++;
    }
    printf("Total sum = %d\n", sum);
    
    return 0;
}