global calcularVarianzaASM
calcularVarianzaASM:
; extern double calcularVarianzaASM(arr,cantidad); 
;       xmm0                        rdi rsi
;primero calcularemos la media
    xor r8, r8
    xor r9, r9
    xor rax, rax
    xorpd xmm1,xmm1
    xorpd xmm2,xmm2
    xorpd xmm3,xmm3
    ; xmm0 ← return 
    ; rdi ← arreglo
    ; rsi ← cant
    mov rax,rdi ;rax → rdi [1 ,2 ,3 ,4 ,5.....]
    mov r9,rsi; r9→ rsi = 6
    calcularmedia:
        movsd xmm1,[rax+r8]
        addsd xmm2,xmm1 ; SI O SI DEBO TRATARLOS COMO DOUBLE AAAH
        add r8,8
        dec r9
    breakpoint21:
        cmp r9,0 ; si rsi>r8 entonces
        jne calcularmedia
    ;despues de sumar todo, lo divido 
	 
	cvtsi2sd xmm1, rsi
    divpd xmm2,xmm1 ; en xmm1 está la media se supone 

    ;limpio registros
    xor r9,r9
    xor r8,r8

    mov r9,rsi
    cvtsi2sd xmm4,r9
    bucle:
    movsd xmm2,[rdi]
    subsd xmm2,xmm1
    mulsd xmm2,xmm2
    addsd xmm3,xmm2;xmm3 es el acumulador
    add rdi,8 ;agrego 8 porque double son 8 bytes B) 
    dec r9
    breakpoint42:
    cmp r9,0
    jne bucle

    fin:
    divsd  xmm3,xmm4
    movsd xmm0,xmm3
    ret 