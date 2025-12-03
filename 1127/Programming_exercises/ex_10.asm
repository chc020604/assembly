.data
Vowels BYTE "AEIOU"
Consonants BYTE "BCDFGHJKLMNPQRSTVWXYZ"
Matrix BYTE 16 DUP(?)

.code
GenerateMatrix PROC
    mov ecx, 16
    mov esi, 0
    call Randomize    

L1:
    mov eax, 2
    call RandomRange   
    cmp eax, 0
    je  PickVowel

    mov eax, 21
    call RandomRange
    mov al, Consonants[eax]
    jmp StoreChar

PickVowel:
    mov eax, 5
    call RandomRange
    mov al, Vowels[eax]

StoreChar:
    mov Matrix[esi], al
    inc esi
    loop L1
    
    ret
GenerateMatrix ENDP

DisplayMatrix PROC
    mov ecx, 4
    mov esi, 0
RowLoop:
    push ecx
    mov ecx, 4
ColLoop:
    mov al, Matrix[esi]
    call WriteChar
    mov al, ' '
    call WriteChar
    inc esi
    loop ColLoop
    
    call Crlf
    pop ecx
    loop RowLoop
    ret
DisplayMatrix ENDP