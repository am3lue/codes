#include <stdio.h>
int main() {
    const float PI = 3.14159;  // defining a constant
    float radius, area;

    printf("Enter radius of circle: ");
    scanf("%f", &radius);

    area = PI * radius * radius;  // using the constant

    printf("Area of circle = %.2f\n", area);
    return 0;
}
