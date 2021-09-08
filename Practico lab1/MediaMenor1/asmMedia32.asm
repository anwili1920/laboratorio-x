;extern int asmMedia32(int *a, int N);
;     eax es el return
section .data
    elmenor  dd 0
global asmMedia32
section	.text
    asmMedia32:
    ; Prólogo para calling conventions en 32 bits
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    ; Limpiar los registros a utilizar
    xor eax,eax
    xor ecx,ecx
    xor ebx,ebx
    xor edx,edx
    ; Punteros iniciales (esto se inicializa en el archivo pregunta1.c)
    mov edi,[ebp + 8]   ; edi <- *arr
    mov ecx,[ebp + 12]  ; ecx <- N
; 12 10 11 9 
    mov eax,[edi]   ; menor <- arr[0] cargamos en eax la primera posición del arreglo
    mov ebx,[ecx]     ; edx ← N
    dec ecx         ; ecx tiene el valor del tamaño del arreglo por lo que lo usamos de contador decreciente 
    jz exit         ; saltamos hacia exit en caso el tamaño del arreglo de datos sea cero 
elMenor: ;Buscare el menor de los elementos en el loop
    add edi, 4
    cmp eax,edi
    jl  nuevomenor
continuar1:
    loop elMenor
    jmp limpiar
nuevomenor: 
    mov eax,[edi]
    jmp continuar1 ; 
limpiar:
    ;mov [rel elmenor],eax
    xor ecx,ecx
    ;xor ebx,ebx
    mov ecx,[ebx]
operacion:
    cmp eax,[edi]
    jne suma
continuar2:
    sub edi,4       ; incrementamos la posición del puntero. Recordar que un entero tiene 4 bytesadd edi,4
    loop operacion
    jmp exit

suma: 
    add ebx,[edi]   ; leemos el siguiente valor y almacenamos la suma acumulada en eax
    jmp continuar2   ; loop para leer todos los valores del arreglo. La instrucción loop trabaja con el registro ecx para saber cuando saltar. Revisar ISA



exit:
    mov eax,[ebx]
    cdq              ; extender el signo de eax hacia edx 
    ;idiv edx         ; cociente: eax <- (edx:eax)/ebx ---- residuo: edx
    ; Epílogo de calling conventions de 32 bits
    pop ebx
    pop edi
    pop esi 
    mov esp,ebp
    pop ebp
    ret
