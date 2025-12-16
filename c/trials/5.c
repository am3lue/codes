#include<stdio.h>

int main(){
    int yesterday = 0, today = 1 , tommorow = 0;
    int n;
    scanf("%d", &n);
    for(int i = 0; i < n; i++) {
        printf("%d ", tommorow);
        yesterday = today;
        today = tommorow;
        tommorow = yesterday + today;
    }
}