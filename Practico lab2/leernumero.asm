section .data
   message1 db "Cuantos numeros sumaras?",10,0
   lenq equ $ - message1
   message2 db "Ingrese los numero",10,0
   len2 equ $ - message1
section .bss
    cantnumeros resw 1
    numero      resw 1
    respuesta   resw 16
    salto       resb 1
section .text
    global main 
    main:
    mov rax, 1
	mov rdi, 1
	mov rsi, message1
	mov rdx, lenq
	syscall
    mov rax, 0 ; SYS_READ
	mov rdi, 0
    mov rsi, cantnumeros
    mov rdx, 16
    syscall
    mov rax, 1
	mov rdi, 1
	mov rsi, message2
	mov rdx, len2
	syscall

    xor r12,r12
    xor rcx,rcx
    mov cl,BYTE[rel cantnumeros]
    sub cl,48
    ;inc rcx
    leyendo:
	    mov rax, 0 ; SYS_READ
	    mov rdi, 0
	    mov rsi, numero
	    mov rdx, 16
	    syscall
        mov rax, 0 ; SYS_READ
	    mov rdi, 0
	    mov rsi, salto
	    mov rdx, 16
	    syscall
        add r12,[rel numero]
    loop leyendo
    
    mov [rel respuesta],r12
    mov rax, 1
	mov rdi, 1
	mov rsi, respuesta
	mov rdx, lenq
	syscall
