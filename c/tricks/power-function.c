#include <stdio.h>
#include <math.h>  // required for pow()

int main() {
    double base, exponent, result;

    printf("Enter base: ");
    scanf("%lf", &base);

    printf("Enter exponent: ");
    scanf("%lf", &exponent);

    result = pow(base, exponent);  // base^exponent

    printf("%.0lf raised to the power %.0lf = %.0lf\n", base, exponent, result);

    return 0;
}
