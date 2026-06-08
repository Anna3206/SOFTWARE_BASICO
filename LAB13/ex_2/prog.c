#include <stdio.h>
#include <stdint.h>
#include <sys/mman.h>
#include <unistd.h>

#define PAGE_START(P) ((intptr_t)(P)&~(pagesize-1))
#define PAGE_END(P) (((intptr_t)(P)+pagesize-1)&~(pagesize-1))

typedef int (*funcp)(int x);

unsigned char codigo[] = {0xe8, 0, 0, 0, 0, 0xc3};

int add(int x) {
    return x + 1;
}

int execpage(void *ptr, size_t len) {
    int ret;
    const long pagesize = sysconf(_SC_PAGE_SIZE);
    if (pagesize == -1) return -1;

    ret = mprotect((void *)PAGE_START(ptr),
        PAGE_END((intptr_t)ptr + len) - PAGE_START(ptr),
        PROT_READ | PROT_WRITE | PROT_EXEC);

    if (ret == -1) return -1;
    return 0;
}

int main(void) {
    execpage(codigo, sizeof(codigo));

    int desloc = (char *)add - ((char *)codigo + 5);

    codigo[1] = desloc & 0xFF;
    codigo[2] = (desloc >> 8) & 0xFF;
    codigo[3] = (desloc >> 16) & 0xFF;
    codigo[4] = (desloc >> 24) & 0xFF;

    funcp f = (funcp)codigo;
    int i = (*f)(10);

    printf("Resultado: %d\n", i);
    return 0;
}