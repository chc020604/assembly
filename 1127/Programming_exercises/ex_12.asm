calc_row_sum PROC
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push esi
    push edi

    mov eax, [ebp+8]    
    mul DWORD PTR [ebp+16] 
    mul DWORD PTR [ebp+12] 
    
    mov esi, [ebp+20]   
    add esi, eax       

    mov ecx, [ebp+16]  
    mov ebx, [ebp+12]  
    xor eax, eax       

SumLoop:
    cmp ebx, 1
    je  AddByte
    cmp ebx, 2
    je  AddWord
    jmp AddDword       

AddByte:
    movzx edx, BYTE PTR [esi]
    add eax, edx
    inc esi
    jmp Next
AddWord:
    movzx edx, WORD PTR [esi]
    add eax, edx
    add esi, 2
    jmp Next
AddDword:
    add eax, DWORD PTR [esi]
    add esi, 4

Next:
    loop SumLoop

    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret 16          
calc_row_sum ENDP
