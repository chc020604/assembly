Get_frequencies PROC USES eax esi edi,
    pString:PTR BYTE,  
    pTable:PTR DWORD    

    mov esi, pString
    mov edi, pTable

L1:
    movzx eax, BYTE PTR [esi] 
    cmp al, 0               
    je  Exit_Proc

    shl eax, 2              
    inc DWORD PTR [edi + eax] 
    
    inc esi
    jmp L1

Exit_Proc:
    ret
Get_frequencies ENDP
