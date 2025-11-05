INCLUDE Irvine32.inc

.code
main PROC
    mov  ecx, 16        ; 바깥 루프 (배경색, 0~15)
    mov  ebx, 0         ; EBX = 배경색 카운터

OuterLoop:
    push ecx
    mov  eax, ebx       ; EAX = 배경색
    shl  eax, 4         ; EAX = 배경색 * 16
    mov  esi, eax       ; ESI에 (배경색 * 16) 저장

    mov  ecx, 16        ; 안쪽 루프 (전경색, 0~15)
    mov  edx, 0         ; EDX = 전경색 카운터

InnerLoop:
    mov  eax, esi       ; EAX = (배경색 * 16)
    add  eax, edx       ; EAX = (배경색 * 16) + 전경색
    call SetTextColor

    mov  al, 'X'
    call WriteChar      ; 문자 'X' 출력
    
    inc  edx
    loop InnerLoop

    call Crlf           ; 한 줄 (배경색)이 끝나면 줄바꿈
    inc  ebx
    pop  ecx
    loop OuterLoop
    
    ; 색상 초기화
    mov  eax, lightGray + (black * 16)
    call SetTextColor
    call Crlf
    
    call WaitMsg
    exit
main ENDP
END main
