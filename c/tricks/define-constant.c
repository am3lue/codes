#include <stdio.h>
#define PI 3.14159   // defining constant using #define
const float e = 2.145216; // defining constant using const keyword

int main() {
    float radius, area;
    printf("Enter radius of circle: ");
    scanf("%f", &radius);

    area = PI * radius * radius;  // using the constant

    printf("Area of circle = %.2f\n", area);
    return 0;
}
