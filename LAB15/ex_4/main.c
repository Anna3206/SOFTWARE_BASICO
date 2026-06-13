#include <stdio.h>
#include <math.h>
#define PI 3.14

double foo3 (double *a, int n);

int main(void){
    double a[5] = {
        PI/6,
        PI/6,
        PI/6,
        PI/6,
        PI/6
    };
    int n = 5;

    double b = foo3(a, n);
    printf("Resultado: %.1f\n", b);

    return 0;
}