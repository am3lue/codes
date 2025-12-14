#include <stdio.h>
int countVowels(char *p) {
    int count = 0;
    while (*p != '\0') {          // go through each character
        char ch = *p;

        if (ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u' ||
            ch=='A' || ch=='E' || ch=='I' || ch=='O' || ch=='U') {
            count++;
        }
        p++;                      // move pointer to next character
    }
    return count;
} 
int main() {
    char str[100];
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);
    printf("Total vowels = %d\n", countVowels(str));
    return 0;
}
