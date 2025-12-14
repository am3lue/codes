#include <stdio.h>

int main() {
    char str[50];
    printf("Enter a string: ");
    gets(str);  		// not safe, but used for demo
    // printf("You entered: ");
    puts("You entered:");
    puts(str);
    return 0;
}
