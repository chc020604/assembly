INCLUDE Irvine32.inc

.code
main PROC
    call Randomize
    call ClrScr

    ; 콘솔 윈도우의 최대 크기를 얻음
    ; EAX = 최대 열(X), EBX = 최대 행(Y)
    call GetMaxXY

    mov  ecx, 100       ; 100번 반복

L1:
    ; 1. 무작위 Y 좌표 (행) 생성
    push eax            ; 최대 X값 보존
    mov  eax, ebx       ; EAX = 최대 Y값
    call RandomRange    ; EAX = 0 ~ (최대 Y - 1)
    mov  dh, al         ; DH (Y 좌표)
    pop  eax            ; 최대 X값 복원

    ; 2. 무작위 X 좌표 (열) 생성
    ; EAX는 이미 최대 X값을 가짐
    call RandomRange    ; EAX = 0 ~ (최대 X - 1)
    mov  dl, al         ; DL (X 좌표)
    
    ; 3. 커서 이동 및 문자 출력
    call Gotoxy
    mov  al, '*'
    call WriteChar

    ; 4. 지연
    mov  eax, 100       ; 100 ms
    call Delay

    loop L1

    call WaitMsg
    exit
main ENDP
END main
