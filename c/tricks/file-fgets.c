#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fp;
    char text[100];

    fp = fopen("data.txt", "r");

    if (fp == NULL)
    {
        printf("Error opening file!");
        exit(1);
    }

    fgets(text, sizeof(text), fp);   // read from file

    printf("File content: %s", text);

    fclose(fp);

    return 0;
}
