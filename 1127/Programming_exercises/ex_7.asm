.data
IsPrime BYTE 65000 DUP(0)

.code
SieveMain PROC
    mov ecx, 65000
    mov esi, 2  

OuterLoop:
    cmp esi, 255    
    ja  PrintPrimes    

    cmp IsPrime[esi], 0 
    jne NextNum         

    mov edi, esi
    add edi, esi      

InnerLoop:
    cmp edi, 65000
    jae NextNum
    mov IsPrime[edi], 1 
    add edi, esi      
    jmp InnerLoop

NextNum:
    inc esi
    jmp OuterLoop

PrintPrimes:
    mov esi, 2
    mov ecx, 65000 - 2
PrintLoop:
    cmp IsPrime[esi], 0
    jne SkipPrint
    mov eax, esi
    call WriteDec     
    call Crlf
SkipPrint:
    inc esi
    loop PrintLoop
    
    ret
SieveMain ENDP