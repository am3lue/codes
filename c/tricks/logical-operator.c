#include <stdio.h>
int main() {
    int a = 5, b = 10;
    printf("(a > 0 && b > 0) = %d\n", (a > 0 && b > 0));
    printf("(a > 10 || b > 5) = %d\n", (a > 10 || b > 5));
    printf("!(a == b) = %d\n", !(a == b));
    return 0;
}
