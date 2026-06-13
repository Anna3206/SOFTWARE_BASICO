#include <stdio.h>

float foo (double a, float b);

int main(void){
    double a = 15.0;
    float b = 10.0;
    float c = foo (a, b);
    printf("Resultado: foo(%.1f, %.1f) = %.1f\n", a, b, c);

    return 0;
}