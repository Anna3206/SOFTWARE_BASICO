/*

int bemboba (int num) {
  int local[4];                   
  int *a;                        
  int i;                           

  for (i=0,a=local;i<4;i++) {
    *a = num;
    a++;
  }
  return addl (local, 4);
}

*/

.text

.globl bemboba
bemboba:

    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp

    movl $0, %r8d               /* i = 0 */
    leaq -32(%rbp), %r9        /* a = local */

for_loop:
    cmpl  $4, %r8d
    jge fim
    movl %edi, (%r9)
    addq $4, %r9
    addl $1, %r8d
    jmp for_loop

fim:
    leaq -32(%rbp), %rdi
    movl $4, %esi
    call addl

    leave
    ret