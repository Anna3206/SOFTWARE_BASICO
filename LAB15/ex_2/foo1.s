/*

float foo1 (float a, float b) {
  return sin(a) + b;
}

*/

.text
.globl foo1
foo1:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movss %xmm1, -4(%rbp)

    cvtss2sd %xmm0, %xmm0
    call sin
    cvtsd2ss %xmm0, %xmm0
    addss -4(%rbp), %xmm0

    leave
    ret