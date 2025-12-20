#include<stdio.h>


float findAverage(int marks[], int n){
    float average; int sum = 0;

    for(int i = 0; i < n; i++){
        sum += marks[i];
    }
    average = sum / n;
    return average;
}

int main(){
    // the average 
    printf("Please enter Marks for the students to find the average\n");
    int marks[5]; 
    for(int i = 0; i < 5; i++){
        printf("Please Enter marks for student (%d): ", i);
        scanf("%i", &marks[i]);
    }
    printf("\n\nCalculating ...\n\n");

    printf("The Average is : %.2f\n", findAverage(marks,5));
    
    return 0;
}