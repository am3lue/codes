#include <stdio.h>

int main() {
    int rows, i, j, k;

    printf("Enter the number of rows: ");
    scanf("%d", &rows);

    for (i = 1; i <= rows; i++) {
        // Print leading spaces
        for (j = i; j < rows; j++) {
            printf(" ");
        }

        // Print stars
        for (k = 1; k <= (2 * i - 1); k++) {
            printf("*");
        }
        printf("\n"); // Move to the next line after each row
    }

    return 0;
}