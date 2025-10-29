#include <stdio.h>

int main(){

    int arr[4] ={1,2,3,4};
    int target = 2, status;
    
    for(int i = 0; i < sizeof(arr); i++){
        if (target == arr[i]){
            status = i;
            break;
        }
    }
    printf("Found in: %d", status);
    return 0;
}