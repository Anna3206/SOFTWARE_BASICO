/*

float foo (double a, float b) {
  return (a+b)*(a-b);
}

*/

.text
.globl foo
foo:
    cvtss2sd %xmm1, %xmm1
    movsd %xmm1, %xmm2
    addsd %xmm0, %xmm1          /* b = a + b */
    subsd %xmm2, %xmm0          /* a = a - b */
    mulsd %xmm1, %xmm0
    cvtsd2ss %xmm0, %xmm0
    ret
