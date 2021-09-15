section .data
    impresion db "el número es: ",10 
	len equ $ - impresion
    variable dw 3
    N dw 5   
section .bss 
    auxiliar resq 1
    digito   resq 1
    salto    resb 1
section .text 
    global main
    main:
    ;inicializar
    xor rax,rax
    xor rbx,rbx
    xor rcx,rcx
    xor r9,r9
    mov rcx,BYTE[rel N] ;rcx←N 
    dec rcx
    mov r9b, BYTE[rel variable];
    mov al,BYTE[rel variable];
    potencia:
        mul r9;
        loop potencia

    dec rax ; a¨2 -1;
    mul r9
    dec r9 ; r9← a-1;
    cdq
    idiv r9 ; extender el signo de eax hacia edx  ;
    mov byte[rel salto], 10
    mov [rel auxiliar],rax
    linea32:
    imprimir:
        mov rax, 1
	    mov rdi, 1
	    mov rsi, impresion
	    mov rdx, len
	    syscall
        xor rax,rax ; limpio el rax
        mov r9,10 ; coloco 10
        mov rax,[rel auxiliar]

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

        mov rax, 1
	    mov rdi, 1
	    mov rsi, salto
	    mov rdx, len
	    syscall

    exit:
        mov rax, 60
        mov rdi, 0
        syscall
    

