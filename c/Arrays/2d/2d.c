#include<stdio.h>

int main(){

    printf("The two dimension array ! \n");
    //de fining the new data tye called string
    typedef char string[12];

    //Declaring the stupid array 2 D one

    int arr[2][3];

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 3; j++){
            scanf("%d", &arr[i][j]);
        }
    }

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 3; j++){
            printf("col %d Row %d: %d  ", i + 1, j + 1, arr[i][j]);
        }
        printf("\n\n\n");
    }

    return 0;
}