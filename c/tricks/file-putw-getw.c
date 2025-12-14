#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fp;
    int num, read_num;

    fp = fopen("numbers.dat", "w");

    if (fp == NULL)
    {
        printf("Error opening file!");
        exit(1);
    }

    printf("Enter an integer: ");
    scanf("%d", &num);

    putw(num, fp);    // write integer to file

    fclose(fp);

    fp = fopen("numbers.dat", "r");
    if (fp == NULL)
    {
        printf("Error opening file!");
        exit(1);
    }

    read_num = getw(fp);   // read integer from file

    printf("Number read from file = %d", read_num);

    fclose(fp);

    return 0;
}
