/*
char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};
int main (void) {
  char *pc = S2;
  while (*pc){
    if(*pc != 123 && *pc != 125){
        printf("%c", *pc);
    }
    pc++;
  }
  printf("\n");
  return 0;
}
*/

.data
S2: .byte   65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf1: .string "%c"
Sf2: .string "\n"

.text
.globl main
main:

  pushq   %rbp             /* copia o valor de rbp (endereço da base) para o topo da pilha (na memória) */
  movq    %rsp, %rbp       /* rbp passa a apontar para o topo (ou seja, pro rbp antigo) */
  subq    $16, %rsp        /* rsp desce 16 bytes */
  movq    %rbx, -8(%rbp)   /* guarda rbx na pilha, 8 bytes abaixo de rbp */
  movq    %r12, -16(%rbp)  /* guarda r12 na pilha, 16 bytes abaixo de rbp */

  movq  $S2, %r12          /* r12 = &S2 */

L1:
  cmpb  $0, (%r12)         /* if (*pc == 0) ? */
  je  finaliza         

  cmpb $123, (%r12)        /* if (*pc == 123) ? */
  je L4

  cmpb $125, (%r12)        /* if (*pc == 125) ? */
  je L4

  jmp exibe

exibe:
  movsbl  (%r12), %eax     /* eax = *r12 (estendendo o byte para 32 bits) */

  movq    $Sf1, %rdi       /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi       /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf  

  jmp  L4                  /* goto L4; */

L4:
  addq  $1, %r12           /* r12 += 1; */
  jmp L1

finaliza:  
  movq    $Sf2, %rdi       /* primeiro parametro (ponteiro)*/
  movl  $0, %eax
  call  printf 

  movq  $0, %rax           /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12  /* recupera r12 */
  movq    -8(%rbp), %rbx   /* recupera rbx */
  leave
  ret      