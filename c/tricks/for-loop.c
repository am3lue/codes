#include <stdio.h>

int main() {
    float salary, total = 0;
    int month;

    for(month = 1; month <= 5; month++) {
        printf("Enter salary for month %d: ", month);
        scanf("%f", &salary);
        total += salary;
    } 

    printf("Total salary paid in 5 months = Rs.%.2f\n", total);
    return 0;
}
