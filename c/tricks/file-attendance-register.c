#include <stdio.h>

int main() {
    FILE *fp;
    char name[50];
    int i;

    // Open file in write mode
    fp = fopen("attendance.txt", "w");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    printf("Enter names of 5 employees present today:\n");

    // Write 5 employee names into file
    for (i = 0; i < 5; i++) {
        printf("Employee %d: ", i + 1);
        scanf("%s", name);
        fprintf(fp, "%s\n", name);  // Write name to file
    }

    fclose(fp);

    // Open file in read mode
    fp = fopen("attendance.txt", "r");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    printf("\n--- Attendance List ---\n");

    // Read names from file and display
    while (fgets(name, sizeof(name), fp) != NULL) {
        printf("%s", name);
    }

    fclose(fp);

    return 0;
}
