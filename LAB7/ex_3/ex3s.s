/*
int main(void){
    for(int cont= 1; cont <= 10; cont++){
        printf("%d\n", (cont*cont));
    }
    return 0;
}
*/

.data
Sf: .string "%d\n"

.text
.globl main
main:

    pushq %rbp
    mov %rsp, %rbp
    subq $8, %rsp
    movq %rbx, -8(%rbp)

    movl $1, %ebx

L1: 
    cmpl $10, %ebx
    jg L2

    movl %ebx, %eax
    imull  %eax, %eax

    movq $Sf, %rdi
    movl %eax, %esi
    movl  $0, %eax
    call printf

    addl $1, %ebx
    jmp L1

L2:
  movq $0, %rax    
  movq -8(%rbp), %rbx   
  leave
  ret     