#include <stdio.h>

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

typedef union { 
  float f;
  unsigned int i;
 } U;

float float2(float f){
    U u;
    u.f = f;
    unsigned int u1 = u.i;

    unsigned int sig = getsig(u1);
    unsigned int frac = getfrac(u1);

    unsigned int exp = getexp(u1);
    exp++;

    u1 = makefloat(sig,exp,frac);
    u.i = u1;
    float f2 = u.f;

    return f2;
}

int main(void){
    float f = 2.5;
    float f2 = float2(f);

    printf("Resultado: %.2f x 2 = %.2f\n", f, f2);

    return 0;
}