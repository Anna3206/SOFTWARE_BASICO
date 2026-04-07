/*
char nums[] = {10, -21, -30, 45};
int main() {
  int i;
  char *p;
  for (i = 0, p = nums; i != 4; i++, p++)
    printf("%d\n", *p);
  return 0;
}
*/

.data
nums: .byte	10, -21, -30, 45
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

L1:
  cmpl  $4, %ebx  
  je  L2         

  movsbl  (%r12), %eax  

  movq    $Sf, %rdi    
  movl    %eax, %esi   
  call  printf    

  addl  $1, %ebx  
  addq  $1, %r12  
  jmp  L1      

L2:  
  movq  $0, %rax  
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      