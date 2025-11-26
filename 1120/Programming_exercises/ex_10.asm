INCLUDE Irvine32.inc

.code
ShowParams PROC,
    paramCount:DWORD

    mov ecx, paramCount
    mov esi, ebp        ; Get caller's EBP (saved in current EBP's stack frame?)
    ; Wait, ShowParams is called BY MySample.
    ; Current Stack Frame:
    ;   [EBP+8] = paramCount
    ;   [EBP+4] = Ret Addr
    ;   [EBP]   = Saved EBP (Caller's EBP -> MySample's EBP)
    
    mov esi, [ebp]      ; ESI = MySample's EBP
    add esi, 8          ; Point to first parameter of MySample ([EBP+8])
    
    ; Note: Parameters are pushed right-to-left (STDCALL).
    ; So [EBP+8] is the last pushed (first parameter).
    ; Addresses increase: [EBP+8], [EBP+12], [EBP+16]...
    
    mov edx, OFFSET msgHeader
    call WriteString
    call Crlf

L1:
    mov eax, esi        ; Address
    call WriteHex
    mov al, ' '
    call WriteChar
    mov al, '='
    call WriteChar
    mov al, ' '
    call WriteChar
    mov eax, [esi]      ; Value
    call WriteHex
    call Crlf
    
    add esi, 4
    loop L1
    
    ret
ShowParams ENDP

; Test Wrapper
MySample PROC, first:DWORD, second:DWORD, third:DWORD
    INVOKE ShowParams, 3
    ret
MySample ENDP

.data
msgHeader BYTE "Stack parameters:",0

.code
main PROC
    INVOKE MySample, 1234h, 5000h, 6543h
    exit
main ENDP
END main