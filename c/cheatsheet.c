#include<stdio.h>

int main() {
    //Well this is a C cheatsheet file
    printf("C Cheatsheet\n"); // printf is an inbuilt function for outputting the result or even text

    // Well in c we heve different data vessels to store different types of data for example
    int myNum = 5;               // Integer (whole number)
    float myFloatNum = 5.99;    // Floating point number
    char myLetter = 'D';        // Character

    // well in outputing them we can use printf function with format specifiers
    printf("Integer: %d\n", myNum); // here the %d is a format specifier for integer

    printf("Float: %.2f\n", myFloatNum); // here the %.2f is a format specifier for float with 2 decimal places

    printf("Character: %c\n", myLetter); // here the %c is a format specifier for character

    // so remember to include the format specifier according to the data type you are using while outputting or even inputing data

    // well in c we can also take input from the user using the scanf function

    int userInput;
    printf("Enter an integer: "); // well this is to Ask the user for input

    scanf("%d", &userInput); // here the & is used to get the address of the variable

    printf("You entered: %d\n", userInput); // outputting the user input


    /* ************************ loops ************************ */

    //for loop
    for (int i = 0; i < 5; i++) { // this is a for loop used only when we know the number of iterations
        printf("Iteration %d\n", i); // i keeps track of the number of iterations (i++ means i = i + 1)
    }

    //while loop
    int j = 0;
    while (j < 5) { // this is a while loop used when we don't know the number of iterations
        printf("While Iteration %d\n", j);
        j++;
    }

    // do while loop
    int k = 0;
    do { // used to execute the block of code at least once before checking the condition
        printf("Do While Iteration %d\n", k);
        k++;
    } while (k < 5);

    return 0;
}