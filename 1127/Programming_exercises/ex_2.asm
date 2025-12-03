Str_concat PROC USES eax esi edi,
    target:PTR BYTE,
    source:PTR BYTE

    mov edi, target
    invoke Str_length, edi  
    add edi, eax            

    mov esi, source
L1:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0              
    jne L1

    ret
Str_concat ENDP
