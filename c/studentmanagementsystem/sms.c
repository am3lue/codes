#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>


FILE *database;
struct Student{
    char name[50];
    int roll_no;
    char address[100];
    char phone[15];
};
struct Student s;


char to_lower(char str[]) {
    for(int i = 0; str[i] != '\0'; i++) {
        if(str[i] >= 'a' && str[i] <= 'z') {
            str[i] = str[i] + 32;   // a → A
        }
    }
} 

void enter_stident(){
    printf("Please Enter The name of the Student: ");
    scanf("%s", s.name);
    printf("Please Enter the roll number: ");
    scanf("%d", &s.roll_no);
    printf("Please Enter the address: ");
    scanf("%s", s.address);
    printf("Please Enter the phone number: ");
    scanf("%s", s.phone);

    fprintf(database, "%s\t%d \t%s\t%s \n", s.name, s.roll_no, s.address, s.phone);
    printf( s.name, s.roll_no, s.address, s.phone);
}

void search_student(char target[]){
    while (fscanf(database, "%s", s.name) != EOF) {
        fscanf(database, "%d", &s.roll_no);
        fscanf(database, "%s", s.address);
        fscanf(database, "%s", s.phone);
        if (to_lower(s.name) == target){
            printf("Details Found are: \n %s %d %s",s.name, s.roll_no, s.address);
            break;
        }
    }
    fscanf(database, "%s",s.name);
    fscanf(database, "%d", &s.roll_no);
    fscanf(database, "%s", s.address);
    fscanf(database, "%s", s.phone);
    printf("Searching for a student\n");
    
    printf("well here is the list of all students \n");
    printf("%s %d %s %s",s.name, s.roll_no, s.address, s.phone);
}

void remove_student(){
    printf("Removing a student\n");
}


int main(){
    
    char choice, entry[13];
 
    printf("do You Wanna Enter A custom Database? (Y/N): ");
    scanf("%c",&choice);
    if (tolower(choice) == 'y'){
        printf("Please Enter the Name of the file: ");
        scanf("%s", entry);
        database = fopen(entry, "a+");
    }else {
        database = fopen("database.txt", "a+");
    }

    if (database != 0){ 
        printf("Database Loading Is Complete!");
    } 
    else{ 
        printf("Error while parsing the file!"); 
        exit(1);
    }

    printf("\n\nWhat Do you wanna do? \n\n");
    printf("--------------------\t MENU \t-----------------\n");
    printf("1. Enter Student Details to the database: \n");
    printf("2. Search for the data in the database: \n");
    printf("3. Remove the Student form a database: \n");
    printf("4. Exit more safely! \n");

    int choosed;
    scanf("%d", &choosed);
    start:;
    switch (choosed) {
        case 1:
            enter_stident();
            break;
        case 2:
            printf("Please Eneter the name of the person you wanna find: ");
            scanf("%s", entry);
            to_lower(entry);
            search_student(entry);
            break;
        case 3:
            remove_student();
            break;
        case 4:
            exit(0);
        
        default:
            printf("I Love You Soo Much");
            goto start;
            break;
    }

    return 0;
}