
#include<stdio.h>
#include<stdlib.h>

// cjui nacho fanya 
int main(){
    printf("Welcome back Teacher! \nPlease enter student\'s Roll Number: "); // Welocoming 
    int RollNumber; scanf("%d", &RollNumber); // scaning the target 
    int Students[10] = {38,35,52,56,60,50,53,38,40,45}; //target is here but not known

    for(int i = 0; i < sizeof(Students)/sizeof(Students[0]); i++){
        if(Students[i] == RollNumber){
            printf("Student Found at position : %d", i+1); // well Alererting the user that the targetis found 
            exit(1); // then leaving the room like a star! (if found)
        }
    }
    printf("Student Not Found! "); //well here the target is nowhere to be found! 
    return 0; // well lets go back home
}