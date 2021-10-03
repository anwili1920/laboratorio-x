global calculolimiteASMB
calculolimiteASMB:
;calculoASM=calculolimiteASMB(n);
; xmm0 →return, rdi→n
    xorpd xmm1,xmm1
    xorpd xmm2,xmm2
    xorpd xmm3,xmm3
    xor r8,r8
    xor r9, r9
    mov r8, 1
    mov r9,rdi
    cvtsi2sd xmm2,r9
    cvtsi2sd xmm1,r8
    cvtsi2sd xmm3,r8
    addsd xmm1,xmm2; ← xmm1=n+1
    divsd xmm1,xmm2; ← xmm1/n = (1+n)/n
    ;movsd xmm2,xmm1; aqui almaceno el valor para ir multiplicandolo
    ; xmm1→ x 
    ; r9 → n or xmm2 → n
    mov rax,r9 ; dividiré lo que está en el rax, para tener el mod
    mov r8,2
    potenciadorBinario:
        xor rdx,rdx
        div r8; rax/r8
        cmp rdx,0 
        jne esimpar
        continuar:
        mulsd xmm1,xmm1
        cmp rax,0
    jg potenciadorBinario

fin:
    movsd xmm0,xmm3; aqui retorno el valor
ret

    esimpar:
        mulsd xmm3,xmm1
    jmp continuar
