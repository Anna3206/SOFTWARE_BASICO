#include <stdio.h>
#include <math.h>
#define PI 3.14

float foo1 (float a, float b);

int main(void){
    float a = (PI)/6, b = 10.0;
    float c = foo1(a, b);
    printf("Resultado: foo(%.1f, %.1f) = %.1f\n", a, b, c);

    return 0;
}