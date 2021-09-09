section .data
    valor32 dd 32
section	.text
    global ordenar
    ordenar:
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
        mov eax,[edi]
        dec ecx
    elMayor: ;Buscare el menor de los elementos en el loop
    add edi, 4
    cmp eax,edi
    jl  nuevomayor
    continuar1:
    loop elMenor
    jmp limpiar
    nuevomayor: 
    mov eax,[edi]
    jmp continuar1

    ;*****************************************
    ; Epílogo de calling conventions de 32 bits
    Fin:
        pop ebx
        pop edi
        pop esi 
        mov esp,ebp
        pop ebp
        ret