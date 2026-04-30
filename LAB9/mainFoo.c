#include <stdio.h>

void foo (int a[], int n);

int main (void){
    int a[] = {1, 2, 0, 3, 0};
    int n = 5;

    foo(a, n);

    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }

    printf("\n");
    return 0;
}