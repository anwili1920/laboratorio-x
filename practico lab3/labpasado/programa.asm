section .data 
    arreglo dq 3,9,4,52,3,8,6,2,2,9
    len dq 10
    valor dq 3.0
section .bss 
    aux resq 1
    arregloy resq 10
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
    xor    r10,r10
    xor    r9,r9
    begin:
    mov r10,[rel arreglo+r9]
    cvtsi2sd xmm0,r10
    addsd xmm1,xmm0
    addsd xmm1,xmm0
    mov r10,[rel arreglo+r9+8]
    cvtsi2sd xmm0,r10
    addsd xmm1,xmm0
    movsd xmm3,[valor]
    divsd xmm1,xmm3
    movsd [rel arregloy+r9],xmm1
    mov ecx,[rel len]
    sub rcx,2
    xorpd  xmm1,xmm1
    iteracion:
        mov r10,[rel arreglo+r9]; x[i-1]
        cvtsi2sd xmm0,r10
        addsd xmm1,xmm0;x[i-1]
        add r9,8;i-1+1
        mov r10,[rel arreglo+r9]; x[i]
        cvtsi2sd xmm0,r10
        addsd xmm1,xmm0;x[i-1]+x[i]
        mov r10,[rel arreglo+r9+8];x[i+1]
        cvtsi2sd xmm0,r10
        addsd xmm1,xmm0;x[i+1]+x[i]
        movsd xmm3,[valor]
        divsd xmm1,xmm3
        movsd [rel arregloy+r9],xmm1
        xorpd  xmm1,xmm1
        loop iteracion
    ultimo:
        mov r10,[rel arreglo+r9]
        cvtsi2sd xmm0,r10
        addsd xmm1,xmm0
        mov r10,[rel arreglo+r9+8]
        cvtsi2sd xmm0,r10
        addsd xmm1,xmm0
        addsd xmm1,xmm0
        movsd xmm3,[valor]
        divsd xmm1,xmm3
        add r9,8
        movsd [rel arregloy+r9],xmm1
    exit:
        mov rax, 60
        mov rdi, 0
        syscall
