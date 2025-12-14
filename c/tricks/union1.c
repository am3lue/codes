#include <stdio.h>
#include<string.h>
union Data {
    int i;
    float f;
    char str[20];
};

int main() {
    union Data d;
    d.i = 10;
    printf("d.i = %d\n", d.i);

    d.f = 3.14;
    printf("d.f = %.2f\n", d.f);

    strcpy(d.str, "Hello");
    printf("d.str = %s\n", d.str);

    // Now previous values are lost:
    printf("d.i after writing str = %d\n", d.i);
    return 0;
}
