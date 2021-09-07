section .data
    valor32 dd 32
section	.text
    global upgratter
    upgratter:
; Prólogo para calling conventions en 32 bits
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    ; Limpiar los registros a utilizar
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
    ;*****************************************
    ; Punteros iniciales 
    mov edi,[ebp + 8]   ; edi <- *arr
    mov ecx,[ebp + 12]  ; ecx <- N
iteracion:
    mov eax,edi
    sub eax,valor32
    mov [edi],[eax]
    add edi,4
    loop iteracion

    ;*****************************************
    ; Epílogo de calling conventions de 32 bits
    pop ebx
    pop edi
    pop esi 
    mov esp,ebp
    pop ebp
    ret