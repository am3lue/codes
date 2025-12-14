#include <stdio.h>

struct Student {
    int roll;
    char name[50];
    float marks;
};

int main() {
    struct Student s[100];
    int n, i;

    printf("Enter number of students: ");
    scanf("%d", &n);

    // Input records
    for (i = 0; i < n; i++) {
        printf("\nEnter details of student %d\n", i + 1);

        printf("Roll Number: ");
        scanf("%d", &s[i].roll);

        printf("Name: ");
        scanf("%s", s[i].name);

        printf("Marks: ");
        scanf("%f", &s[i].marks);
    }

    // Tabular Output
    printf("\n---------------------------------------------------------\n");
    printf("%-10s %-20s %-10s\n", "Roll No", "Name", "Marks");
    printf("---------------------------------------------------------\n");

    for (i = 0; i < n; i++) {
        printf("%-10d %-20s %-10.2f\n", s[i].roll, s[i].name, s[i].marks);
    }

    printf("---------------------------------------------------------\n");

    return 0;
}
