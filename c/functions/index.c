#include<stdio.h>

/*
WELL THE FORMAT OF THE FUNCTION IS
DataType function_name(Arguments){

    //block of ur code is here

    return value //this is according to your DataType
}
*/

/*
WE HAVE TWO TYPES OF FUNCTIONS 
 --> Built in function 
 --> user defined Function
*/

int add_values(int x, int y){
    int sum = x + y;
    return sum; // well here am passing the value to the place where the function is called (passed by value)
}

void add_reference(int *x, int *y, int *sum){
    *sum = *x + *y;
}

int main(){ // well this is the main function (and its a built-in function)
    printf("Hello, Guys =)"); // well this is the defined fuction due to  #include<stdio.h> block

    // so lets add two numbers using functions
    int a = 10, b = 20; // well here am assigning the values of a and b
    printf("the sum is: %d\n\n", add_values(a,b)); // well since am using values (called by values) ill tap the results on printf function

    //well now les call by refering to the variable adresses (call by reference)
    int sum;
    add_reference(&a,&b,&sum); // here i have taken the values directly fom the main function

    printf("The reefrenced sum is %d", sum); // since we are calling using the address we have to use the address of the variables
    return 0;
}