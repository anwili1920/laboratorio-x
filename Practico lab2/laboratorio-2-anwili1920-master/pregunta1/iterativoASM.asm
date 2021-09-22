section .data
    N dw 6
    
section .bss
    resultado resq 1 
section .text
global main
    main:
    ;inicializo
    xor rax,rax
    xor rbx,rbx
    xor rcx,rcx
    xor rdx,rdx
    xor r9,r9
    xor r12,r12
    ;almaceno el valor de n en un registro
    mov cl,BYTE[rel N] ;rcx←N =3 
    
    sumatoria:
    ;ahora rcx es N
      mov rax,rcx ; almaceno i 
      mul rax ;realizo la potencia al cuadrado
      add r12,rax
      breakpoint1:
      xor rax,rax;limpio rax
      loop sumatoria
    guardarmem_:
       mov [rel resultado],r12 ; almaceno el resultado en memoria
    exit:
        mov rax, 60
        mov rdi, 0
        syscall
    