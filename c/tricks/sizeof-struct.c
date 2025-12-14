#include<stdio.h>
struct student {  
    int roll;
    char name[10];
    int marks;
};

int main() {  
    	int size;
    	struct student s;
    	size = sizeof(s);
    	printf("\n Size of Structure : %d \n", size);
    	return(0);
}
