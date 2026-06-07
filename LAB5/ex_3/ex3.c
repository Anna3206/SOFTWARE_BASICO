#include <stdio.h>

void dump (void *p, int n) {
    unsigned char *p1 = p;
    while (n--) {
        printf("%p - %02x\n", p1, *p1);
        p1++;
    }
    printf("\n");
}

struct X1 {
    char c1;
    int i;
    char c2;
};

struct X2 {
    long l;
    char c;
};

struct X3 {
    int i;
    char c1;
    char c2;
};

struct X4 {
    struct X2 x;
    char c;
};

struct X5 {
    char c1;
    char c2;
    char c3;
};

struct X6 {
    short s1;
    int i;
    char c[3];
    short s2;
};

union U1 {
    int i;
    char c[5];
};

union U2 {
    short s;
    char c[5];
};

int main (void) {

    struct X1 x1 = {'A', 0x11111111, 'B'};
    struct X2 x2 = {0x2222222222222222, 'C'};
    struct X3 x3 = {0x33333333, 'D', 'E'};
    struct X4 x4 = {{0x4444444444444444, 'F'}, 'G'};
    struct X5 x5 = {'H', 'I', 'J'};
    struct X6 x6 = {0x5555, 0x66666666, {'K','L','M'}, 0x7777};

    union U1 u1;
    u1.i = 0x88888888;

    union U2 u2;
    u2.s = 0x9999;

    printf("X1 size: %zu\n", sizeof(x1));
    dump(&x1, sizeof(x1));

    printf("X2 size: %zu\n", sizeof(x2));
    dump(&x2, sizeof(x2));

    printf("X3 size: %zu\n", sizeof(x3));
    dump(&x3, sizeof(x3));

    printf("X4 size: %zu\n", sizeof(x4));
    dump(&x4, sizeof(x4));

    printf("X5 size: %zu\n", sizeof(x5));
    dump(&x5, sizeof(x5));

    printf("X6 size: %zu\n", sizeof(x6));
    dump(&x6, sizeof(x6));

    printf("U1 size: %zu\n", sizeof(u1));
    dump(&u1, sizeof(u1));

    printf("U2 size: %zu\n", sizeof(u2));
    dump(&u2, sizeof(u2));

    return 0;
}