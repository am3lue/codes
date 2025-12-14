#include <stdio.h>

int main() {
    char str[50] = "Hello C Programming";
    printf("Output using fputs:\n");
    fputs(str, stdout); 		// prints without newline
				                // stdout: writes to screen
    fputs(str, stdout);         // Does not append newline
    return 0;
}
