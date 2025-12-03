BubbleSort PROC USES eax ecx esi,
    pArray:PTR DWORD,
    count:DWORD

    mov ecx, count
    dec ecx        

L1: 
    push ecx        
    mov esi, pArray 

    mov dl, 0       

L2:
    mov eax, [esi]      
    cmp [esi+4], eax    
    jge L3            
    
    xchg eax, [esi+4]   
    mov [esi], eax
    mov dl, 1           

L3:
    add esi, 4          
    loop L2          

    cmp dl, 0        
    je  SortDone     

    pop ecx            
    loop L1          

SortDone:
    cmp dl, 0
    jne RetLabel
    pop ecx            

RetLabel:
    ret
BubbleSort ENDP