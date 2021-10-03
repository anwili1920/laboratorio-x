global ASMLimite
; extern double calcularVarianzaASM(n)
;       xmm0                        rdi   
section .data 
    unitario dq 1.0
section .text
    ASMLimite:
    xorpd  xmm2,xmm2
    xorpd  xmm3,xmm3
    xorpd  xmm4,xmm4
    xorpd  xmm5,xmm5
    xor rax,rax
    xor rcx,rcx
    xor r10,r10
    mov rax,rdi
    ;movsd xmm3,rdi
    cvtsi2sd xmm3,rax
    movsd xmm1,QWORD[rel unitario]
    movsd xmm4,QWORD[rel unitario]
    divsd xmm1,xmm3
    addsd xmm1,xmm4
    movsd xmm2,xmm1
    mov rcx,rdi
    dec  rcx
    potencia:
        mulsd xmm1,xmm2
        loop potencia
exit:
    ;muevo el resultado al return xmm0
    movsd xmm0,xmm1
    ret
