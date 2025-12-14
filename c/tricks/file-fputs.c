#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fp;
    char text[100];

    fp = fopen("data.txt", "w");

    if (fp == NULL)
    {
        printf("Error opening file!");
        exit(1);
    }

    printf("Enter a line of text: ");
    fgets(text, sizeof(text), stdin);   // read from keyboard

    fputs(text, fp);    // write to file

    fclose(fp);

    printf("Data written successfully.");

    return 0;
}
