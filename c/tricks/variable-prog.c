#include <stdio.h>

int main() {
    
    int a;  // Declaration (telling the compiler about the variable)
    int b;  // Definition (memory is allocated here, same as declaration in C)
    int c = 10;  // Initialization (assigning an initial value)
     
    a = 5;  // Assigning values after declaration/definition
    b = 20;  // Assigning values after declaration/definition
    
    printf("Value of a = %d\n", a);
    printf("Value of b = %d\n", b);
    printf("Value of c = %d\n", c);

    return 0;
}
