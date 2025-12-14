#include <stdio.h>
int num = 10; // global variable
void change()
{
    num = num + 5; // modify the same variable
}

int main()
{
    printf("Before change: %d\n", num);
    change();
    printf("After change: %d\n", num); // value is still updated (persisted)
    return 0;
}
