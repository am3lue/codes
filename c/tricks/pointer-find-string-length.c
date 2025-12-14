#include <stdio.h>

int stringLength(char *str) {
    int count = 0;

    while (*str != '\0') {   // loop until null character
        count++;
        str++;               // move pointer to next character
    }

    return count;
}

int main() {
    char name[50];

    printf("Enter a string: ");
    fgets(name, sizeof(name), stdin);

    // Remove newline (optional)
    for (int i = 0; name[i]; i++) {
        if (name[i] == '\n')
            name[i] = '\0';
    }

    printf("Length of string = %d\n", stringLength(name));

    return 0;
}
