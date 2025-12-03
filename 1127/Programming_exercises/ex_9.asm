BinarySearch PROC USES ebx edx esi edi,
    pArray:PTR DWORD,  
    count:DWORD,     
    searchVal:DWORD    

    ; Register Usage:
    ; EBX = first (index)
    ; EDX = last (index)
    ; ESI = mid (index)
    ; EDI = pArray
    ; EAX = searchVal / temp value

    mov ebx, 0           
    mov edx, count
    dec edx               
    mov edi, pArray
    mov eax, searchVal

L1:
    cmp ebx, edx         
    jg  NotFound

    ; mid = (first + last) / 2
    mov esi, ebx
    add esi, edx
    shr esi, 1          
    mov ecx, [edi + esi*4]
    
    cmp ecx, eax          
    je  Found          
    
    cmp ecx, eax        
    jl  IsLower

    mov edx, esi
    dec edx
    jmp L1

IsLower:
    mov ebx, esi
    inc ebx
    jmp L1

Found:
    mov eax, esi        
    jmp Exit_Proc

NotFound:
    mov eax, -1       

Exit_Proc:
    ret
BinarySearch ENDP
