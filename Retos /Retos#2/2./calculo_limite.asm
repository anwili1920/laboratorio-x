section .data 
    N dq 5.0
    unitario dq 1.0
section .bss 
    resultadoresq resq 1
section .text
    global _start
    _start:
    xorpd  xmm0,xmm0
    xorpd  xmm1,xmm1
    xorpd  xmm2,xmm2
    xorpd  xmm3,xmm3
    xorpd  xmm4,xmm4
    xorpd  xmm5,xmm5
    xor    rcx,rcx

    cvtsd2si ecx,[rel N]; muevo para realizar el loop 
    movsd xmm3,[N] 
    movsd xmm1,[unitario]
    movsd xmm4,[unitario]
    divsd xmm1,xmm3
    addsd xmm1,xmm4
    movsd xmm2,xmm1
    cvtsd2si ecx,[rel N]
    dec  rcx
    potencia:
        mulsd xmm1,xmm2
        loop potencia
    breakpoint1:
    exit: 
    mov rax, 60
    mov rdi, 0
    syscall