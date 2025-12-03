Str_nextWord PROC USES edi,
    pString:PTR BYTE,  
    delimiter:BYTE      

    mov edi, pString
    mov al, delimiter

    
L1:
    mov bl, [edi]
    cmp bl, al       
    je  Found
    cmp bl, 0         
    je  NotFound
    inc edi
    jmp L1

Found:
    mov BYTE PTR [edi], 0  
    mov eax, edi
    inc eax                
    cmp eax, eax           
    ret

NotFound:
    or al, 1              
    ret
Str_nextWord ENDP