section .datacheems
    porcentajes dq 0.2,0.08,0.1,0.62
    cpis dq 5,4,3,4
    lon dq 4 
section .bss
    productopunto resq 1
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
    mov rcx,[rel lon]
    
    producto_punto:
        movsd xmm0,[rel porcentajes + r9]
        mov rax,[rel cpis +r9]
        cvtsi2sd xmm1,rax
        mulsd xmm0,xmm1
        addsd xmm2,xmm0
        add r9,8
        loop producto_punto
    exit:
        mov rax, 60
        mov rdi, 0
        syscall
