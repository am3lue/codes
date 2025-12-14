#include <stdio.h>
int main() {
    int choice;
    printf("----- Cafeteria Menu -----\n");
    printf("1. Coffee\n");
    printf("2. Tea\n");
    printf("3. Sandwich\n");
    printf("4. Juice\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);
    switch(choice) {
        case 1:
            printf("You selected Coffee. Price = Rs. 40\n");
            break;
        case 2:
            printf("You selected Tea. Price = Rs. 20\n");
            break;
        case 3:
            printf("You selected Sandwich. Price = Rs. 60\n");
            break;
        case 4:
            printf("You selected Juice. Price = Rs. 50\n");
            break;
        default:
            printf("Invalid choice! Please select from the menu.\n");
    }
    return 0;
}
