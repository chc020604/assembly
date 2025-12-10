.686
.model flat, c
.code

bubbleSort PROC
    push ebp
    mov ebp, esp
    
    mov esi, [ebp + 8]      
    mov ecx, [ebp + 12]     
    
    dec ecx                
    cmp ecx, 0
    jle END_SORT           

OUTER_LOOP:
    push ecx                
    mov edx, ecx            
    mov edi, esi            

INNER_LOOP:
    mov eax, [edi]         
    mov ebx, [edi + 4]   
    
    cmp eax, ebx
    jle NO_SWAP          

    mov [edi], ebx
    mov [edi + 4], eax

NO_SWAP:
    add edi, 4           
    dec edx
    jnz INNER_LOOP        

    pop ecx              
    dec ecx
    jnz OUTER_LOOP        

END_SORT:
    mov esp, ebp
    pop ebp
    ret
bubbleSort ENDP
END