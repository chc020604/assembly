INCLUDE Irvine32.inc

.data
grayColor DWORD 7   ; Light Gray
whiteColor DWORD 15 ; White

.code
DrawSquare PROC, color:DWORD
    mov eax, color
    shl eax, 4      ; Set background color
    or eax, 0       ; Set foreground (black, irrelevant here)
    call SetTextColor
    
    mov al, ' '
    call WriteChar
    call WriteChar  ; Draw two spaces to make it look square
    ret
DrawSquare ENDP

DrawRow PROC, startColor:DWORD, nextColor:DWORD
    mov ecx, 4
L1:
    INVOKE DrawSquare, startColor
    INVOKE DrawSquare, nextColor
    loop L1
    
    ; Reset color to default console color (light gray on black)
    mov eax, lightGray + (black * 16)
    call SetTextColor
    call Crlf
    ret
DrawRow ENDP

main PROC
    mov ecx, 4      ; Draw 8 rows (4 pairs of alternating rows)
L1:
    INVOKE DrawRow, grayColor, whiteColor
    INVOKE DrawRow, whiteColor, grayColor
    loop L1

    exit
main ENDP
END main