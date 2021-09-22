section .data 
    N dq 5.0
    arreglo dq 2.0,0.0,1.0,8.0,4.0
section .bss 
    auxiliar resq 1 
    media resq 1

section .text
    global _start 
    _start:
    xorpd  xmm0,xmm0
    xorpd  xmm1,xmm1
    xorpd  xmm2,xmm2
    xorpd  xmm3,xmm3
    xorpd  xmm4,xmm4
    xorpd  xmm5,xmm5
    ;primero sacamos la media 
    cvtsd2si ecx,[rel N]; muevo para realizar el loop 
    movsd xmm3,[ N] 
    calcular_media:
        movsd xmm1,[rel arreglo+r10]
        add r10,8
        divsd xmm1,xmm3
        addsd xmm2,xmm1
        loop calcular_media
    cvtsd2si ecx,[rel N]
    xor r10,r10
    xorpd xmm1,xmm1    
    sumatoria:
        movsd xmm1,[rel arreglo+r10]
        add r10,8
        subsd xmm1,xmm2
        mulsd xmm1,xmm1
        addsd xmm4,xmm1
        loop sumatoria
    divsd xmm4,xmm3

exit:
        mov rax, 60
        mov rdi, 0
        syscall