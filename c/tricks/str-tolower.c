#include <stdio.h>
#include <ctype.h>   // for tolower()

int main() {
    char s[50];

    printf("Enter a string: ");
    scanf("%s", s);

    for (int i = 0; s[i] != '\0'; i++) {
        s[i] = tolower(s[i]);   // convert each character
    }

    printf("Lowercase string: %s", s);

    return 0;
}

