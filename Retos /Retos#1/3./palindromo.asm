section .data
    si_ db "Si es",10
    no_ db "No es",10 
    ;palabra db "aaannaaa"
    impresion db "Es palindroma? ",10 
    len equ $ - impresion
    salto db 10 

section .bss 
    resultado resq 1
    auxiliar resb 8
    palabra resq 16
section .text 
    global main
    main:
    xor rax,rax ; limpio todos los registros 
    xor rbx,rbx
    xor r9,r9
    ; SYS_READ
	mov rax, 0
	mov rdi, 0
	mov rsi, palabra
	mov rdx, 16
	syscall
    mov rbx, QWORD[rel palabra]
    mov rax, QWORD[rel palabra]  
    bswap rbx
    xor rbx,rax
    jz si_es
    no_es:
     mov rax, 1
	mov rdi, 1
    mov rsi, no_
	mov rdx, 5
	syscall
    jmp imprimir
    si_es:
    mov rax, 1
	mov rdi, 1
    mov rsi, si_
	mov rdx, 5
    syscall
    imprimir:
    mov rax, 1
	mov rdi, 1
	mov rsi, salto
	mov rdx, 1
	syscall
    exit:
        mov rax, 60
        mov rdi, 0
        syscall
    