#include <stdio.h>

void display()
{
    int num = 10;  // local variable
    printf("Value of num inside display() = %d\n", num);
}

int main()
{
    int num = 20;  // different variable (local to main)
    display();
    // num here is not accessible from display()
    printf("Value of num in main = %d\n", num); 
    return 0;
}
