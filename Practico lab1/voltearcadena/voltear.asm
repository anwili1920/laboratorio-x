section	.text
    global voltear
    voltear:
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
    guardar:
        mov eax,[edi]
        add edi,4
        push eax
    loop guardar
    ; reinicio el puntero    
        mov ecx,[ebp+12]
        mov edi,[ebp+8]
    modificar:
        pop eax 
        mov [edi],eax
        add edi,4
    loop modificar
    ;*****************************************
    ; Epílogo de calling conventions de 32 bits
    Fin:
        pop ebx
        pop edi
        pop esi 
        mov esp,ebp
        pop ebp
        ret