Str_trim_leading PROC USES eax ecx esi edi,
    pString:PTR BYTE,
    charToRemove:BYTE

    mov esi, pString   
    mov al, charToRemove

ScanLoop:
    cmp BYTE PTR [esi], al
    jne CopyPart    
    cmp BYTE PTR [esi], 0
    je  Done         
    inc esi
    jmp ScanLoop

CopyPart:
    mov edi, pString
    
CopyLoop:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne CopyLoop

Done:
    ret
Str_trim_leading ENDP
