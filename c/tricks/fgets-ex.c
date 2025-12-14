#include <stdio.h>

int main() {
    char str[10];
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin); 	// safe input
				                        // stdin: reads from keyboard
    printf("You entered: %s", str);
    return 0;
}
