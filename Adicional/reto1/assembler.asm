section .data
    x dq 3
    N dq 5
section .bss
    respuesta resw 1
section .text
    global _start
    _start:
    ;inicializar
    xor rax,rax
    xor rbx,rbx
    xor rcx,rcx
    
    mov r8,[x]
    mov r9,[N]
    mov r10,[x]
    mov rax,r8
    mov rbx,r9
    mov rcx,respuesta

    denominador:
    dec r10 ; a-1
    numerador:
        potencia:
        mul r8
        dec rbx
        cmp rbx,1
        jne potencia
    dec rax; ( a^n -1)
    mul r8 ; a*(a^n -1)
    ;mov r12,[rax]
    ; debo unir numerador ( rax) entre denominador(r10)
    div r10
    mov rcx,[rax]
    end:
    ret