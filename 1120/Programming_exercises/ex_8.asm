INCLUDE Irvine32.inc

.code
CountMatches PROC USES esi edi ecx edx,
    ptrArr1:PTR SDWORD,
    ptrArr2:PTR SDWORD,
    len:DWORD

    mov esi, ptrArr1
    mov edi, ptrArr2
    mov ecx, len
    mov eax, 0      ; Match counter

L1:
    mov edx, [esi]
    cmp edx, [edi]
    jne Next
    inc eax         ; Match found
Next:
    add esi, 4
    add edi, 4
    loop L1

    ret
CountMatches ENDP

; Test program
.data
arrA1 SDWORD 1, 2, 3, 4, 5
arrA2 SDWORD 1, 0, 3, 0, 5
arrB1 SDWORD 10, 20, 30
arrB2 SDWORD 10, 20, 30
msg BYTE "Matches: ",0

.code
main PROC
    INVOKE CountMatches, OFFSET arrA1, OFFSET arrA2, LENGTHOF arrA1
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf

    INVOKE CountMatches, OFFSET arrB1, OFFSET arrB2, LENGTHOF arrB1
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP
END main