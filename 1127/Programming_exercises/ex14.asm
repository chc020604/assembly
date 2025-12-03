Str_trim_set PROC USES eax ecx esi edi,
    pString:PTR BYTE,
    pCharSet:PTR BYTE 

    mov edi, pString
    invoke Str_length, edi
    add edi, eax
    dec edi           

TrimLoop:
    cmp edi, pString  
    jb  Done
    
    mov al, [edi]       
    mov esi, pCharSet
CheckSet:
    mov dl, [esi]
    cmp dl, 0           
    je  StopTrimming    
    
    cmp al, dl        
    je  RemoveIt        
    inc esi
    jmp CheckSet

RemoveIt:
    mov BYTE PTR [edi], 0 
    dec edi              
    jmp TrimLoop

StopTrimming:
Done:
    ret
Str_trim_set ENDP
