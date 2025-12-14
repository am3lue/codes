#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char s1[100], s2[100], temp[100];
    int i;

    printf("Enter first string: ");
    gets(s1);

    printf("Enter second string: ");
    gets(s2);

    // strlen
    printf("\nLength of s1 = %d", strlen(s1));
    printf("\nLength of s2 = %d", strlen(s2));

    // strcpy
    strcpy(temp, s1);
    printf("\nAfter strcpy(temp, s1): %s", temp);

    // strcat
    strcat(temp, s2);
    printf("\nAfter strcat(temp, s2): %s", temp);

    // strrev
    printf("\nReverse of s1: %s", strrev(s1));

    // strcmp
    int result = strcmp(s1, s2);
    printf("\nstrcmp(s1, s2) = %d", result);

    // strlwr
    printf("\nLowercase of s2: %s", strlwr(s2));

    // strupr
    printf("\nUppercase of s2: %s", strupr(s2));
    return 0;
}
