Str_copyN PROC USES eax ecx esi edi,
    source:PTR BYTE,
    target:PTR BYTE,
    maxChars:DWORD

    mov esi, source
    mov edi, target
    mov ecx, maxChars
    
    cmp ecx, 0
    je  Exit_Proc       

L1:
    mov al, [esi]       
    mov [edi], al       
    cmp al, 0           
    je  Exit_Proc       
    inc esi
    inc edi
    loop L1             

    mov BYTE PTR [edi], 0

Exit_Proc:
    ret
Str_copyN ENDP