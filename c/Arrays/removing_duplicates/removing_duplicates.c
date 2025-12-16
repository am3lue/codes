#include<stdio.h>
#include<stdlib.h>

int* arr_remover(int* arr, int n, int *out_len){
    int *new_arr = malloc(n * sizeof(int));
    if (!new_arr) {
        *out_len = 0;
        return NULL;
    }

    int count = 0;
    for(int i = 0; i < n; i++){
        int state = 0;
        for(int j = 0; j < i; j++){
            if(arr[i] == arr[j]){
                state = 1;
                break;
            }
        }
        if (!state){
            new_arr[count++] = arr[i];
        }
    }

    *out_len = count;
    return new_arr;
}

int main(){
    printf("Please Enter size of the array(less than 1024): ");
    int n; scanf("%d", &n);
    int arr[n];

    printf("Please Enter the elements: \n");
    for(int i = 0; i < n; i++){
        printf("Enter Element %d: ", i + 1);
        scanf("%d", &arr[i]);
    }

    int new_n;
    int *output = arr_remover(arr, n, &new_n);

    printf("Well after Messing up with the array\n");
    for(int i = 0; i < new_n; i++){
        printf("%d ", output[i]);
    }
    printf("\n");

    free(output);
    return 0;
}