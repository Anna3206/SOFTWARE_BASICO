/*
int nums[4] = {65, -105, 111, 34};

int main (void) {
  int i;
  int s = 0;

  for (i=0;i<4;i++)
    s = s+nums[i];

  printf ("soma = %d\n", s);

  return 0;
}
*/

.data
nums: .int 65, -105, 111, 34
Sf: .string "soma = %d\n"

.text
.globl main
main:

  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movq %rbx, -8(%rbp)
  movq %r12, -16(%rbp)

  leaq nums(%rip), %r12   # &nums
  movl $0, %ebx           # i = 0
  movl $0, %r13d          # s = 0

L1:
  cmpl $4, %ebx
  jge L2

  movl %ebx, %ecx
  imull $4, %ecx
  addq %r12, %rcx
  movl (%rcx), %eax

  addl %eax, %r13d

  addl $1, %ebx
  jmp L1

L2:
  movq $Sf, %rdi
  movl %r13d, %esi
  movl $0, %eax
  call printf

  movl $0, %eax
  movq -8(%rbp), %rbx
  movq -16(%rbp), %r12
  leave
  ret