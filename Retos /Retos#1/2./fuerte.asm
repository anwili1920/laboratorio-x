section .data
impresion db "el número es (AL REVES): ",10 
 len equ $ - impresion
 salto db 10
 valor dw 145 ; el número fuerte
   
section .bss 
    resultado resq 1
    digito   resq 1
    
section .text 
    global main
    main:
    ;inicializo
    xor rax,rax
    xor rbx,rbx
    xor rcx,rcx
    xor r9,r9
    xor r12,r12

    mov al,BYTE[rel valor]; rax → 145
    mov r9,10 ; coloco 10
    mov r12,0
    digitoxdigito:
        cdq
        idiv r9 ; rax→14  rdx→5
        mov [rel digito],rdx
        mov rbx,rax; salvo el valor 
        xor rax,rax; limpio la variable
        mov rax,[rel digito];inicializo el factorial
        mov rcx,rax;copio el valor y debo disminuir
        dec rcx
        jz rcx_0
        jmp factorial
        continuar:
        add r12,rax;sumo los factoriales
        xor rax,rax;limpio el rax
        mov rax,rbx ; recupero lo guardado
        cmp rax,0
        jne digitoxdigito
        jmp evaluar
    factorial:
        mul rcx ; multiplico el número a medida que disminuye 
    loop factorial
    jmp continuar
    
    rcx_0:
        inc r12
    
    imprimir:
        mov rax, 1
	    mov rdi, 1
	    mov rsi, impresion
	    mov rdx, len
	    syscall
    ;imprimir si es fuerte o no
        xor rax,rax ; limpio el rax
        mov r9,10 ; coloco 10
        mov rax,r12;coloco el número que necesito imprimir
        ;bswap rax

        numero:
        cdq
        idiv r9 ; en rax → 36 y en rdx→3
        ADD rdx,48 ;Ascii el '0'→ 48
        mov [rel digito],rdx
        mov rbx,rax ;almaceno en un registro auxiliar la parte de rax
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

        evaluar:
        mov al,BYTE[rel valor]
        cmp rax,r12
        jne noes_
        mov QWORD[rel resultado],84
        jmp ultimo
        noes_:
        mov QWORD[rel resultado],70
        
        ultimo:
        mov rax, 1
	    mov rdi, 1
	    mov rsi, resultado
	    mov rdx, 1
	    syscall
        mov rax, 1
	    mov rdi, 1
	    mov rsi, salto
	    mov rdx, 1
	    syscall
    exit:
        mov rax, 60
        mov rdi, 0
        syscall
    