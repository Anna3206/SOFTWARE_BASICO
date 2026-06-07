#include <stdio.h>

int fat(int x);

int main (void){
    int x = 2;
    int fat_x = fat(x);

    printf("O fatorial de %d é %d\n", x, fat_x);

    return 0;
}