#include <stdio.h>

int main() {
    int sales[12];
    int i, total = 0;
    int highest, lowest, highHour = 0, lowHour = 0;

    // Input sales for 12 hours
    printf("Enter sales for each hour (9 AM to 9 PM):\n");
    for (i = 0; i < 12; i++) {
        printf("Hour %d: ", 9 + i);
        scanf("%d", &sales[i]);
        total += sales[i];
    }

    // Initialize highest and lowest
    highest = lowest = sales[0];

    // Find highest and lowest hourly sales
    for (i = 1; i < 12; i++) {
        if (sales[i] > highest) {
            highest = sales[i];
            highHour = i;
        }
        if (sales[i] < lowest) {
            lowest = sales[i];
            lowHour = i;
        }
    }

    // Output results
    printf("\n--- Sales Analysis Report ---\n");
    printf("Total Sales of the Day: %d\n", total);
    printf("Highest Sales: %d at %d:00 hrs\n", highest, (9 + highHour));
    printf("Lowest Sales : %d at %d:00 hrs\n", lowest, (9 + lowHour));

    return 0;
}
