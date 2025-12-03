Str_remove PROC USES eax esi edi,
    pStart:PTR BYTE,    
    count:DWORD       

    mov esi, pStart    
    mov edi, pStart
    add edi, count     

L1:
    mov al, [edi]      
    mov [esi], al      
    cmp al, 0           
    je  Exit_Proc
    inc esi
    inc edi
    jmp L1

Exit_Proc:
    ret
Str_remove ENDP
