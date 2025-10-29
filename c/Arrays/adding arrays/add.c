#include<stdio.h>

int main(){
    // we have to add the arrays
    // user inputs 

    int rows ,cols ;

    //just taking user inputs
    printf("Enter Number Of Rows: ");
    scanf("%d", &rows);

    printf("Enter number of columns: ");
    scanf("%d", &cols);

    int arr [2][2];
    int arr1 [2][2];

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 2; j++){
            printf("Enter : ");
            scanf("%d", &arr[i][j]);
        }
    }

    int rows1 ,cols1;

    printf("Enter Number Of Rows: ");
    scanf("%d", &rows1);

    printf("Enter number of columns: ");
    scanf("%d", &cols1);

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 2; j++){
            scanf("%d", &arr1[i][j]);
        }
    }

    int sum[2][2];
    printf("Adding ...\n\n");
    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 2; j++){
            sum[i][j] = arr[i][j] + arr1[i][j];
        }
    }

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 2; j++){
            printf("%d ", sum[i][j]);
        }
        printf("\n");
    }

    return 0;
}