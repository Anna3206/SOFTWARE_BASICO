/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  int sum = 0;
  for (i = 0, p = nums; i != 4; i++, p++)
    sum += *p;
  printf("%d\n", sum);
  return 0;
}
*/

.data
nums:  .int  10, -21, -30, 45
Sf:  .string "%d\n"   

.text
.globl  main
main:

  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movl  $0, %ebx 
  movq  $nums, %r12 
  movl $0, %eax

L1:
  cmpl  $4, %ebx
  je  L2        

  addl  (%r12), %eax
  
  addl  $1, %ebx 
  addq  $4, %r12  
  jmp  L1        

L2:  
  movq    $Sf, %rdi    
  movl    %eax, %esi  
  call  printf       

  movq  $0, %rax  
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
