#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef unsigned packed_t;

int string2num (char *s, int base) {
  int a = 0;
  for (; *s; s++) {
    if(isdigit(*s))
      a = a*base + (*s - '0');
    else if((*s >= 'A') && (*s < (base-10+'A')))
      a = a*base + ((*s - 'A') + 10);
    else if((*s >= 'a') && (*s < (base-10+'a')))
      a = a*base + ((*s - 'a') + 10);
    else {
      printf("pane: numero invalido! \n");
      exit(1);
    }
  }
  return a;
}

int xbyte (packed_t word, int bytenum) { 
  packed_t v[4] = {0x000000ff, 0x0000ff00, 0x00ff0000, 0xff000000};

  /*Isolando o byte*/
  int x = word & v[bytenum];
  x = x >> (bytenum * 8);

  /*Caso o número seja negativo, expandimos o sinal até o bit mais significativo*/
  int y = x & 0x00000080;
  if (y == 0x00000080){
    x = x | 0xffffff00;
  };
  return x;

  /*Versão mais enxuta: return (int)((signed char)(word >> (bytenum * 8)));*/
  /*Cast para signed char: interpreta como um número de 1 byte com sinal (faz o complemento a dois e a detecção de negativo automaticamente)*/
  /*Cast para int: faz a extensão de sinal*/
}

int main (int argc, char **argv) {
  int x;
  if (argc != 3) {
    printf ("uso: %s <word (em hexadecimal)> <bytenum>\n", argv[0]);
    exit(1);
  }

  x = xbyte(string2num(argv[1], 16), atoi(argv[2]));
  printf ("%08x  %d\n", x, x);
  return 0;
}