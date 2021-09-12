section .data
 numero dq 145 
 cantdigit db 3
 
section .bss
   letter resb 1 ;Almaceno un espacio en la memoria de 16 bits
section .text
    global _start
    _start:
    mov  rax,[numero];almaceno rax->145
    mov  r8 ,[numero]; r8->145
    mov  r9b,[cantdigit]; r9b->3
    mov  rbx, 0; aqui será mi sumatoria
    mov  r12, 10
    mov rcx,letter
    extraer_digitos:
    div r12 ; rax/10->14 ; rax/10-> 1
    dec r9b; r9b->2 ; r9b->1

    mov r10,rax ; r10->14 ; r10->1
    
    mov r11, rdx; r11->5 ; r11->4
    xor rax , rax
    mov al, 1; rax->1

       iterar:
        mul r11; -> 1*5 ; 5*4 ; 5*4*3*2
        dec r11; 5-1:4 ; 4-1: 3 ; 3-1:2 ;2-1:1
        cmp r11,0
       jne iterar

    add rbx,rax;   rbx+rax aqui guardo la suma
    xor rax,rax

    mov rax,r10; rax->14 ;SE CAE AQUÍ NO SÉ PORQUÉ    

    cmp r9b,0 
    jne extraer_digitos

    cmp rbx,r8
    jne nofuerte

    mov byte[rcx], 'T' ; aqui declaro el tamaño con el que se va a trabajar
    jmp end
    nofuerte:
    mov byte[rcx], 'F'
end:
   ret
     
