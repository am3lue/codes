#include <stdio.h>
int main() {
    int marks, count = 0;
    float sum = 0;
    char choice;
    do {
        printf("Enter marks: ");
        scanf("%d", &marks);
        sum += marks;
        count++;

        printf("Do you want to enter more marks? (y/n): ");
        scanf(" %c", &choice);                              // space before %c to clear newline
    } while(choice == 'y' || choice == 'Y');

    
    printf("Average marks = %.2f\n", sum / count);
    return 0;
}
