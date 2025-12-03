Str_find PROC USES ecx esi edi,
    source:PTR BYTE,    
    target:PTR BYTE     

    mov esi, target     
    
OuterLoop:
    mov al, [esi]      
    cmp al, 0          
    je  NotFound       

    mov edi, source     
    mov ecx, esi     
    
InnerLoop:
    mov dl, [edi]      
    cmp dl, 0       
    je  Found
    
    mov al, [ecx]      
    cmp al, dl          
    jne NextChar      
    
    inc edi
    inc ecx
    jmp InnerLoop

NextChar:
    inc esi          
    jmp OuterLoop

Found:
    mov eax, esi        
    test eax, eax      
    cmp eax, eax        
    ret

NotFound:
    or  al, 1        
    ret
Str_find ENDP