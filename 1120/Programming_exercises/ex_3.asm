INCLUDE Irvine32.inc

.data
currentColor DWORD 0   ; Start with black (0)
whiteColor DWORD 15    ; White is constant

.code
; DrawSquare PROC (Same as Ex 2)
DrawSquare PROC, color:DWORD
    mov eax, color
    shl eax, 4      
    call SetTextColor
    mov al, ' '
    call WriteChar
    call WriteChar 
    ret
DrawSquare ENDP

; DrawRow PROC (Same as Ex 2)
DrawRow PROC, startColor:DWORD, nextColor:DWORD
    mov ecx, 4
L1:
    INVOKE DrawSquare, startColor
    INVOKE DrawSquare, nextColor
    loop L1
    mov eax, lightGray + (black * 16)
    call SetTextColor
    call Crlf
    ret
DrawRow ENDP

; DrawBoard PROC
; Draws the entire board with specified alternating color
DrawBoard PROC, altColor:DWORD
    mov dx, 0
    call Gotoxy     ; Move cursor to top-left
    
    mov ecx, 4
L1:
    INVOKE DrawRow, altColor, whiteColor
    INVOKE DrawRow, whiteColor, altColor
    loop L1
    ret
DrawBoard ENDP

main PROC
    mov ecx, 16     ; Repeat 16 times
L_Main:
    INVOKE DrawBoard, currentColor
    
    mov eax, 500    ; Delay 500ms
    call Delay
    
    inc currentColor
    and currentColor, 0Fh ; Keep color in range 0-15
    
    loop L_Main

    exit
main ENDP
END main