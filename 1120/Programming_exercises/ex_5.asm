INCLUDE Irvine32.inc

.code
DifferentInputs PROC,
    v1:DWORD, v2:DWORD, v3:DWORD

    mov eax, v1
    cmp eax, v2
    je  FalseReturn     ; v1 == v2

    cmp eax, v3
    je  FalseReturn     ; v1 == v3

    mov eax, v2
    cmp eax, v3
    je  FalseReturn     ; v2 == v3

    mov eax, 1          ; All different
    ret

FalseReturn:
    mov eax, 0
    ret
DifferentInputs ENDP

; Test program
.data
msg BYTE "Result: ",0

.code
main PROC
    ; Test 1: All different
    INVOKE DifferentInputs, 10, 20, 30
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf

    ; Test 2: v1 == v2
    INVOKE DifferentInputs, 10, 10, 30
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf

    ; Test 3: v1 == v3
    INVOKE DifferentInputs, 10, 20, 10
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf
    
    exit
main ENDP
END main