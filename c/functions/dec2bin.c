#include<stdio.h>

//making the decimal to bin convetor

int main(){
    //Definening the variables
    int input;
    
    //Prompting the user
    printf("Please Enter Your Number: ");
    scanf("%d", &input);
    
    char output[33]; // Assuming a 32-bit integer, plus null terminator
    int i = 0;

    while (input > 0) {
        output[i] = (input % 2) + '0'; // Convert remainder to character '0' or '1'
        input /= 2;
        i++;
    }
    output[i] = '\0'; // Null-terminate the string

    // Reverse the string (since we built it in reverse order)
    for (int j = 0; j < i / 2; j++) {
        char temp = output[j];
        output[j] = output[i - 1 - j];
        output[i - 1 - j] = temp;
    }

    if (i == 0) { // Handle case where input was 0
        printf("0\n");
    } else {
        printf("%s\n", output);
    }
    return 0;
}