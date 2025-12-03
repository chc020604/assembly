CheckAndPrint PROC USES esi,
    pString:PTR BYTE  

    mov esi, pString
    mov ecx, 4
    mov edx, 0      

CntLoop:
    mov al, [esi]
    call IsVowel      
    jnz NotV
    inc edx
NotV:
    inc esi
    loop CntLoop

    cmp edx, 2        
    jne Skip

    mov edx, pString
    call WriteString   
    call Crlf
Skip:
    ret
CheckAndPrint ENDP
