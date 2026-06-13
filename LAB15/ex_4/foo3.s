/*

double foo3 (double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
}

*/

.text
.globl foo3
foo3:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)
    movq %r13, -24(%rbp)

    movl $0, %ebx           /* i = 0 */
    movl %esi, %r12d        /* n em %r12d */
    movq %rdi, %r13         /* a em %r13 */

    movq $0, -32(%rbp)      /* 0 em -32(%rbp) */

for_loop:
    cmpl %r12d, %ebx
    jge fim

    movsd (%r13), %xmm0     /* *a em %xmm0 */
    call sin
    addsd -32(%rbp), %xmm0  /* r += sin(*a) */
    movsd %xmm0, -32(%rbp)

    addq $8, %r13           /* a++ */
    addl $1, %ebx           /* i++ */

    jmp for_loop

fim:
    movsd -32(%rbp), %xmm0
    movq -24(%rbp), %r13
    movq -16(%rbp), %r12
    movq -8(%rbp), %rbx
    leave
    ret