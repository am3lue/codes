#include<stdio.h>

int main() {
    int a[10] = {1,0,3,5,2,6,8,4,9,7};
    int temp;

    for(int i = 0; i < 10; i++) {
        for(int j = 0; j < 10; j++) {
            if(a[i] < a[j]) {
                temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }
    }

    for(int i = 0; i < 10; i++) {
        printf("%d ", a[i]);
    }
    return 0;
}