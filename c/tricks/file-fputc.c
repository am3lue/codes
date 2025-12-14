#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fp;
    int i;
    char text[] = "Hello World!";

    fp = fopen("output.txt", "w");

    if (fp == NULL)
    {
        printf("Error opening file!");
        exit(1);
    }

    for (i = 0; text[i] != '\0'; i++)
    {
        fputc(text[i], fp);   // write character-by-character
    }

    fclose(fp);

    printf("Data written to file successfully.");

    return 0;
}
