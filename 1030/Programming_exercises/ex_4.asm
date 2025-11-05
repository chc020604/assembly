INCLUDE Irvine32.inc

.data
prompt1 BYTE "Enter first integer: ",0
prompt2 BYTE "Enter second integer: ",0
resultMsg BYTE "The sum is: ",0

.code
main PROC
    mov  ecx, 3         ; 3번 반복

L1:
    call ClrScr         ; 화면 지우기 (루프 시작 시)

    ; 커서를 중앙 근처로 이동 (예: 12행 10열)
    mov  dh, 12         ; Row
    mov  dl, 10         ; Column
    call Gotoxy

    ; 첫 번째 정수 입력
    mov  edx, OFFSET prompt1
    call WriteString
    call ReadInt        ; EAX에 정수 저장
    mov  ebx, eax       ; 첫 번째 정수를 EBX에 백업

    ; 두 번째 정수 입력
    mov  dh, 13
    mov  dl, 10
    call Gotoxy
    mov  edx, OFFSET prompt2
    call WriteString
    call ReadInt        ; EAX에 두 번째 정수 저장

    ; 합계 계산 및 출력
    add  eax, ebx       ; EAX = EAX + EBX
    mov  dh, 15
    mov  dl, 10
    call Gotoxy
    mov  edx, OFFSET resultMsg
    call WriteString
    call WriteInt       ; EAX(합계) 출력
    call CrLf
    
    call WaitMsg        ; 각 반복 후 사용자가 확인하도록 대기

    loop L1

    exit
main ENDP
END main
