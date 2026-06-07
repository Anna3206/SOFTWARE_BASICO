  .data
  nums: .int 3, -5, 7, 8, -2
  s1:   .string "%d\n"

  .text
  .globl main
  main:

     pushq %rbp
     movq  %rsp, %rbp
     subq  $16, %rsp
     movq  %rbx, -8(%rbp)
     movq  %r12, -16(%rbp)

    movl $0, %ebx 
    movq $nums, %r12  

loop:
  cmpl $5, %ebx
  jge fim

  movl (%r12), %edi 
  movl $1, %esi
  call filtro

  movl %eax, %esi      
  movq $s1, %rdi      
  movl $0, %eax        
  call printf

  addq $4, %r12
  addl $1, %ebx

  jmp loop

fim:
  movl $0, %eax

  movq -8(%rbp), %rbx
  movq -16(%rbp), %r12
  leave
  ret