
section .data
    palabra db "abcba",0
    cantdigit db 5;con esto calculo la longitud de la palabra
 
section .bss
  auxiliar resb 10 ; aqui almacenaré un espacio igual que palabra
section .text
    global _start

    _start:
        xor rax,rax
        xor rbx,rbx
        xor rcx,rcx 
        xor rdx,rdx
        xor r8, r8
        xor r9, r9
    ;valores 
        mov r8b,[cantdigit] ; 5:"abcba" + 1: ",0"
        mov r9b,r8b; copio el valor en r9
        dec r9 ; decremento, entonces será n-1 , n=cant letras
    ; punteros
        mov r10,palabra ; →'abcba' 
        add r10, r9 ; muevo el puntero 'abcda'←

; en esta función lo que hago es copiar al reves mi cadena
    copiar:
        mov r11, auxiliar ; → auxiliar 
        add r11, rbx ; para avanzar en auxiliar
        mov r12,[r10]; 'abcba'← 
        mov [r11],r12
        inc rbx
        dec r10
        dec r9
        cmp r9, 0
    jne copiar
 ;en esta linea le agrego el valor 0 al final de la cola 
    inc rbx
    add r11, rbx
    mov byte[r11], 0
    mov r13,[cantdigit] ; aqui almaceno la cantida de digitos del número
    comparar: 
    mov rbx, [r8]
    cmp [r11],rbx
    jne nopalindroma
    inc r11
    inc rbx
    dec r13
    cmp r13,0
    je palindroma
    jmp comparar    

    nopalindroma:
    mov rdx, 'F'
    jmp end
    palindroma: 
    mov rdx, 'T'
    end :
    ret
    ;muevo el puntero
    