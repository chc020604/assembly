INCLUDE Irvine32.inc

.code
CountNearMatches PROC USES esi edi ecx edx,
    ptrArr1:PTR SDWORD,
    ptrArr2:PTR SDWORD,
    len:DWORD,
    diff:DWORD

    mov esi, ptrArr1
    mov edi, ptrArr2
    mov ecx, len
    mov eax, 0          ; Counter

L1:
    mov edx, [esi]      ; val1
    sub edx, [edi]      ; val1 - val2
    
    ; Calculate absolute value of difference
    cmp edx, 0
    jge CheckDiff
    neg edx             ; Make positive

CheckDiff:
    cmp edx, diff
    jg  Next            ; If diff > maxDiff, skip
    inc eax             ; Else, increment count

Next:
    add esi, 4
    add edi, 4
    loop L1

    ret
CountNearMatches ENDP

; Test program
.data
arr1 SDWORD 10, 20, 30, 40
arr2 SDWORD 12, 22, 35, 38  ; Diffs: 2, 2, 5, 2
diffVal DWORD 2
msg BYTE "Near matches: ",0

.code
main PROC
    INVOKE CountNearMatches, OFFSET arr1, OFFSET arr2, LENGTHOF arr1, diffVal
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP
END main