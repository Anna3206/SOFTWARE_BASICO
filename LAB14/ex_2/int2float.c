/* Sem arredondamento */

#include <stdio.h>
#include <math.h>

#define getsig(x)        ((x)>>31 & 1)
#define getexp(x)        ((x)>>23 & 0xff)
#define getfrac(x)       ((x) & 0x7fffff)
#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

typedef union {
  float f;
  unsigned int i;
} U;

float int2float(int i){
  if(i == 0){ return (float)i; }
  else{
    int sig = 0;
    if(i < 0){ sig = 1; i *= -1; }
    
    i = (unsigned int)i;
    unsigned int temp = 0, exp = 31;

    while(temp != 1){
      temp = i;
      exp--;
      temp >>= exp;
    }
    temp = i;

    printf("exp = %u\n", exp);
    unsigned int frac = temp ^ (1u << exp);
    if (exp > 23){
      frac >>= (exp - 23);
    }
    else {
      frac <<= (23 - exp);
    }
    printf("frac = %0x\n", frac);

    exp += 127;

    U u;
    unsigned int u1 = makefloat(sig,exp,frac);
    u.i = u1;
    float f = u.f;

    return f;
  }
}

int main() {
   int i;

   printf("\n******** int2float ********\n");
   i = 0;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 1;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -1;  
   printf(" %d -> %10.4f\n", i, int2float(i));
   i = 0x7fffffff;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -i;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   return 0;
}