global calculolimiteASM
calculolimiteASM:
    ;extern double calculolimiteASM(int)
    ; xmm0→ return , rdi→n
    xorpd xmm1,xmm1
    xorpd xmm2,xmm2
    xorpd xmm3,xmm3
    xor r8,r8
    xor r9, r9
    mov r8, 1
    mov r9,rdi
    cvtsi2sd xmm2,r9
    cvtsi2sd xmm1,r8
    addsd xmm1,xmm2; ← xmm1=n+1
    divsd xmm1,xmm2; ← xmm1/n = (1+n)/n
    movsd xmm2,xmm1; aqui almaceno el valor para ir multiplicandolo
    cmp r9, 1
    je fin
    potenciador:
    mulsd xmm1,xmm2
    dec r9
breakpoint22:
    cmp r9,1
    jg potenciador
fin:
    movsd xmm0,xmm1
ret