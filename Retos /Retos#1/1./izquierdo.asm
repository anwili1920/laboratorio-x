section .data
 suma dw 1 ; como todos los números elevados a la 0 son 1 , entonces la sumatoria empieza por 1 
 variable dw 3
 N dw 5
 impresion db "el número es: ",10 
 len equ $ - impresion  
 salto db 10
section .bss 
    auxiliar resq 1
    digito   resq 1
    ;salto    resb 1
section .text 
    global main
    main:
    ;inicializo
    xor rax,rax
    xor rbx,rbx
    xor rcx,rcx
    xor r9,r9
    xor r12,r12
    ;almaceno los valores en registros 
    mov cl,BYTE[rel N] ;rcx←N 
    dec rcx
    mov r9b, BYTE[rel variable];
    mov al,BYTE[rel variable];
    ; sumo 1 + variable a la 1 
    mov r12b,BYTE[rel variable];
    mov r10,rcx; ahora r10 es N
    sumatoria:
    ;ahora rcx es N
      jmp potencia ;realizo la potencia
      continuar:
      add rax,r12
      mov r12,rax
      ;replanteo los valores 
      xor rax,rax;limpio rax
      mov al,BYTE[rel variable]; rax es el valor a de nuevo
      dec r10
      mov rcx,r10      
      cmp r10,0
      jne sumatoria
      jmp imprimir

    potencia:
        mul r9;
        loop potencia
    jmp continuar

    imprimir:
        mov rax, 1
	    mov rdi, 1
	    mov rsi, impresion
	    mov rdx, len
	    syscall
        ;imprimir número
        xor rax,rax ; limpio el rax
        mov r9,10 ; coloco 10
        mov rax,r12
    numero:
        cdq
        idiv r9 ; en rax → 36 y en rdx→3
        ADD rdx,48
        mov [rel digito],rdx
        mov rbx,rax
        mov rax, 1
	    mov rdi, 1
	    mov rsi, digito
	    mov rdx, len
	    syscall
        mov rax,rbx
        cmp rax,0
        jne numero

        ;imprimir salto 
        mov rax, 1
	    mov rdi, 1
	    mov rsi, salto
	    mov rdx, 1
	    syscall
    exit:
        mov rax, 60
        mov rdi, 0
        syscall
    