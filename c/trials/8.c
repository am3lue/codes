#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>


int is_prime(int n){
    if(n < 2) return 0;
    int state = 1;  // Assume prime until proven otherwise
    for(int i = 2; i < n; i++){
        if(n % i == 0){
            state = 0;  // Found a divisor, not prime
            break;
        }
    }
    return state;
}


int main() {

    /* Enter your code here. Read input from STDIN. Print output to STDOUT */ 
    int n, prime = 0, count = 1, prime_count = 0;
    scanf("%d", &n); 

    while(prime_count < n){
        if(is_prime(count)){
            prime = count;
            prime_count++;
        }
        count++;
    }  
    printf("%d", prime * prime);  // Use integer multiplication instead of pow for integers
    return 0;
}
