section .data
    valor dd 0
    divisor dd 2           ; INDICACIONES DEL PROGRAMA EN EL .C
section	.text
    global selector
    selector:
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
        mov ebx, 2
    iteracion:
        mov eax,[edi] ; arr[0] → eax
        cdq
        idiv ebx
        cmp edx,0
        je borrar
    continuar:
        add edi,4
        loop iteracion
        jmp Fin
    borrar:
        mov edx,[rel valor]
        mov [edi], edx
        jmp continuar


    ;*****************************************
    ; Epílogo de calling conventions de 32 bits
    Fin:
        
        pop ebx
        pop edi
        pop esi 
        mov esp,ebp
        pop ebp
        ret