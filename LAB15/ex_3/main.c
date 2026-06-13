#include <stdio.h>
#include <math.h>
#define PI 3.14

double foo2 (float a, float b);

int main(void){
    float a = (PI)/6, b = (PI)/3;
    double c = foo2(a, b);
    printf("Resultado: foo(%.1f, %.1f) = %.1f\n", a, b, c);

    return 0;
}