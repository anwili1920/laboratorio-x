section .data
    palabra db "cheems"
    len equ $ - palabra 
    cadena db  "******"
    mensajeganador db "Ganaste",10
    lon equ $ - mensajeganador
    mensajeperdedor db "Perdiste",10
    lon1 equ $ - mensajeperdedor
section .bss
    caracter resb 1
section .text
global main
    main:
    ;inicializo
    xor rax,rax
    xor rbx,rbx
    xor rcx,rcx
    xor rdx,rdx
    xor r9,r9
    xor r13,r13
    xor r12,r12
    xor r14,r14
    iteracion:
        mov rax, 0 ; SYS_READ
	    mov rdi, 0
	    mov rsi, caracter
	    mov rdx, 1 ;pongo un byte
	    syscall

        mov al, BYTE[rel caracter];paso el char
        mov rcx, len;iteraré la cantidad de caracteres ERROR AQUI 
        xor r10,r10;puntero 
        xor r8,r8 ;bandera 
        jmp buscar ; busco si esta en la palabra el caracter
    continuar:
        cmp rbx,5
        je perdiste ; si llega a 5 perdio
        ;imprimo la cadena de * 
        mov rax, 1
	    mov rdi, 1
	    mov rsi, cadena
	    mov rdx, len
	    syscall
        cmp r13,rdx ;comparo la cant de caracteres encontrados la longitud 
        je ganaste ; si son iguales gano!
        ;imprimo la cadena de * 
    jmp iteracion ; itero hasta que pierda o gane
    
    buscar:;buscaré si esta en la cadena
        mov r9b, BYTE[rel palabra]
        breakpoint46:
        add r9,  r10
        cmp r9, rax ; comparo r9 y rax por el caracter
        je encontro
        inc r10
    loop buscar 
    cmp r8,1 ; si r8 es 1 significa que si encontro.
    je continuar
    inc rbx ; si r8 es 0 entonces intento fallido incrementa 
    jmp continuar
    encontro:; aqui modificaré la cadena y activaré  bandera ( si se depura, si entra a la etiqueta )
        mov r12b, BYTE[rel cadena]
        add r12, r10
        ; aqui paso un pequeño error 
        mov r14b,[rax]
        mov [r12], r14b
        mov r8, 1
        inc r13;contador de caracteres encontrados 
    jmp continuar ; o buscar

 ; imprimo los mensajes finales d
    perdiste:
        mov rax, 1
	    mov rdi, 1
	    mov rsi, mensajeperdedor
	    mov rdx, lon1
	    syscall
    jmp exit 
    ganaste:
        mov rax, 1
	    mov rdi, 1
	    mov rsi, mensajeganador
	    mov rdx, lon
	    syscall
    jmp exit
    exit:
        mov rax, 60
        mov rdi, 0
        syscall