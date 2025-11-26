INCLUDE Irvine32.inc

.data
array SDWORD 10, 20, 30, 40, 50, 60
count DWORD LENGTHOF array

.code
Swap PROC USES eax esi edi,
    pVal1:PTR DWORD,
    pVal2:PTR DWORD

    mov esi, pVal1
    mov edi, pVal2
    mov eax, [esi]
    xchg eax, [edi]
    mov [esi], eax
    ret
Swap ENDP

main PROC
    ; Display original array
    mov esi, OFFSET array
    mov ecx, count
    call DumpMem    ; Uses Irvine32 DumpMem to show array

    ; Exchange loop
    mov esi, OFFSET array
    mov ecx, count
    shr ecx, 1      ; Divide count by 2 (pairs)
    
L1:
    ; Calculate pointers to current pair (esi, esi+4)
    ; Note: Swap expects pointers, so we pass addresses
    INVOKE Swap, esi, addr [esi+4] ; addr [esi+4] is pseudo-code idea
    
    ; Correct way: Calculate address of second element
    ; We can pass esi and (esi+4) directly if Swap takes pointers
    ; But INVOKE calculates arguments.
    
    ; Let's just do it inline or carefully call Swap
    ; The prompt asks to use Swap procedure.
    
    ; Let's fix the loop logic:
    ; Pair 1: [esi], [esi+4]
    ; Next pair: [esi+8], [esi+12] ...
    
    ; Re-write loop properly:
    mov esi, OFFSET array
    mov ecx, count
    shr ecx, 1      ; Loop count/2 times
    
ExchangeLoop:
    mov ebx, esi    ; Addr of first
    add ebx, 4      ; Addr of second
    
    INVOKE Swap, esi, ebx
    add esi, 8      ; Move to next pair
    loop ExchangeLoop

    ; Display modified array
    call Crlf
    mov esi, OFFSET array
    mov ecx, count
    call DumpMem

    exit
main ENDP
END main