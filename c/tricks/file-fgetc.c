#include <stdio.h>

int main()
{
    FILE *fp = fopen("file.txt", "r");
    int ch;

    if (fp == NULL)
    {
        printf("Error!");
        return 1;
    }

    while ((ch = fgetc(fp)) != EOF)
    {
        putchar(ch);   // print char directly
    }

    fclose(fp);
    return 0;
}
