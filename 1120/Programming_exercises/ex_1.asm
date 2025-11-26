INCLUDE Irvine32.inc

.code
FindLargest PROC USES esi ecx edx,
    ptrArray:PTR SDWORD,
    count:DWORD

    mov esi, ptrArray   ; ESI points to the array
    mov ecx, count      ; ECX = loop counter
    mov eax, [esi]      ; Assume first element is largest
    add esi, 4          ; Point to next element
    dec ecx             ; Decrement count (first element already checked)
    jz  Done            ; If count was 1, we are done

L1:
    mov edx, [esi]      ; Get current element
    cmp edx, eax        ; Compare with current largest
    jle Next            ; If current <= largest, skip
    mov eax, edx        ; Else, update largest
Next:
    add esi, 4          ; Next element
    loop L1

Done:
    ret
FindLargest ENDP

; Test program
.data
array1 SDWORD 10, 30, 25, -5, 100
array2 SDWORD -10, -20, -5, -50
array3 SDWORD 1
msg1 BYTE "Largest in array1: ",0
msg2 BYTE "Largest in array2: ",0
msg3 BYTE "Largest in array3: ",0

.code
main PROC
    ; Test array1
    mov edx, OFFSET msg1
    call WriteString
    INVOKE FindLargest, OFFSET array1, LENGTHOF array1
    call WriteInt
    call Crlf

    ; Test array2
    mov edx, OFFSET msg2
    call WriteString
    INVOKE FindLargest, OFFSET array2, LENGTHOF array2
    call WriteInt
    call Crlf

    ; Test array3
    mov edx, OFFSET msg3
    call WriteString
    INVOKE FindLargest, OFFSET array3, LENGTHOF array3
    call WriteInt
    call Crlf

    exit
main ENDP
END main