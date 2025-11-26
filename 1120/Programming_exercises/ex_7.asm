INCLUDE Irvine32.inc

.code
CalcGCD PROC,
    valA:DWORD, valB:DWORD

    mov eax, valA
    mov ebx, valB
    
    cmp ebx, 0
    je  BaseCase    ; If b == 0, return a

    ; Recursive step: GCD(b, a % b)
    mov edx, 0
    div ebx         ; EDX = a % b
    
    INVOKE CalcGCD, valB, edx
    ret

BaseCase:
    mov eax, valA   ; Return a
    ret
CalcGCD ENDP

; Test program
.data
strGCD BYTE "GCD is: ",0

.code
main PROC
    ; (5, 20)
    INVOKE CalcGCD, 5, 20
    mov edx, OFFSET strGCD
    call WriteString
    call WriteInt
    call Crlf

    ; (24, 18)
    INVOKE CalcGCD, 24, 18
    mov edx, OFFSET strGCD
    call WriteString
    call WriteInt
    call Crlf
    
    ; ... (add other test cases similarly)

    exit
main ENDP
END main