INCLUDE Irvine32.inc

.data
prompt1 BYTE "Enter first integer: ",0
prompt2 BYTE "Enter second integer: ",0
resultMsg BYTE "The sum is: ",0

.code
main PROC
    call ClrScr         ; 화면 지우기

    ; 커서를 중앙 근처로 이동 (예: 12행 10열)
    mov  dh, 12         ; Row
    mov  dl, 10         ; Column
    call Gotoxy

    ; 첫 번째 정수 입력
    mov  edx, OFFSET prompt1
    call WriteString
    call ReadInt        ; EAX에 정수 저장
    mov  ebx, eax       ; 첫 번째 정수를 EBX에 백업

    ; 두 번째 정수 입력 (커서 위치는 WriteString이 알아서 이동)
    mov  dh, 13         ; 다음 줄
    mov  dl, 10
    call Gotoxy
    mov  edx, OFFSET prompt2
    call WriteString
    call ReadInt        ; EAX에 두 번째 정수 저장

    ; 합계 계산 및 출력
    add  eAX, ebx       ; EAX = EAX + EBX
    mov  dh, 15         ; 결과 출력 위치
    mov  dl, 10
    call Gotoxy
    mov  edx, OFFSET resultMsg
    call WriteString
    call WriteInt       ; EAX(합계) 출력
    call CrLf

    call WaitMsg
    exit
main ENDP
END main
