INCLUDE Irvine32.inc

.code
FindThrees PROC USES esi ecx,
    ptrArray:PTR DWORD,
    count:DWORD

    mov esi, ptrArray
    mov ecx, count
    sub ecx, 2          ; Need at least 3 elements to check
    jle NotFound        ; If count < 3, return 0

L1:
    mov eax, [esi]
    cmp eax, 3
    jne Next
    
    ; Check next element
    mov eax, [esi+4]
    cmp eax, 3
    jne Next
    
    ; Check third element
    mov eax, [esi+8]
    cmp eax, 3
    je Found            ; All three are 3

Next:
    add esi, 4
    loop L1

NotFound:
    mov eax, 0
    ret

Found:
    mov eax, 1
    ret
FindThrees ENDP

; Test program
.data
arr1 DWORD 1, 2, 3, 3, 3, 4
arr2 DWORD 3, 3, 2, 3, 3, 3
arr3 DWORD 1, 3, 3, 2, 3
msg1 BYTE "arr1 result: ",0
msg2 BYTE "arr2 result: ",0
msg3 BYTE "arr3 result: ",0

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    INVOKE FindThrees, OFFSET arr1, LENGTHOF arr1
    call WriteInt
    call Crlf

    mov edx, OFFSET msg2
    call WriteString
    INVOKE FindThrees, OFFSET arr2, LENGTHOF arr2
    call WriteInt
    call Crlf

    mov edx, OFFSET msg3
    call WriteString
    INVOKE FindThrees, OFFSET arr3, LENGTHOF arr3
    call WriteInt
    call Crlf

    exit
main ENDP
END main