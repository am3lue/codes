#include <stdio.h>

// Global variable (declared outside all functions)
int globalVar = 100;

void function1() {
    int localVar = 10;  // Local variable (exists only in this function)
    printf("Inside function1:\n");
    printf("Local variable = %d\n", localVar);
    printf("Global variable = %d\n", globalVar);
}

void function2() {
    int localVar = 20;  // Another local variable (different from function1’s localVar)
    printf("\nInside function2:\n");
    printf("Local variable = %d\n", localVar);
    printf("Global variable = %d\n", globalVar);
}

int main() {
    printf("Inside main:\n");
    printf("Global variable = %d\n", globalVar);

    function1();
    function2();

    return 0;
}
