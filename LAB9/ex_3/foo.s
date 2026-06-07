.text
.globl foo
foo:
    pushq %rbp
    movq %rsp, %rbp

    movl $0, %eax          # i = 0
    movl $0, %edx          # s = 0

for_cond:
    cmpl %esi, %eax        # i < n ?
    jge fim

    addl (%rdi,%rax,4), %edx    # s += a[i]

    cmpl $0, (%rdi,%rax,4)      # if (a[i] == 0)
    jne prox

    movl %edx, (%rdi,%rax,4)    # a[i] = s
    movl $0, %edx               # s = 0

prox:
    addl $1, %eax               # i++
    jmp for_cond

fim:
    popq %rbp
    ret