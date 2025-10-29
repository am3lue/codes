#include <stdio.h>

int main(){
    printf("Welcome Br\n\nPlease Enter amount of numbers u wanna enter: ");

    int amount ,minimum_number, maximum_number;
    scanf("%i", &amount);

    int arr[amount];
    maximum_number = arr[0];
    minimum_number = arr[0];
    for(int i = 0; i < amount; i++) {
        printf("Please Enter Number: ");
        scanf("%d",&arr[i]);
    }

    //this is for the Largest numbers
 
    for(int i = 0; i < amount; i++){
        if(maximum_number < arr[i]){
            maximum_number = arr[i];
        }
    }

    // this is for the minimum numbers mostly
    for(int i = 0; i < amount; i++){
        if (minimum_number  > arr[i]){
            minimum_number = arr[i];
        }
    }
    printf("Array 0 %d\n", arr[0]);
    printf("The smallest is: %d and the largest is: %d" ,minimum_number ,maximum_number);

    return 0;
}