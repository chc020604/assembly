INCLUDE Irvine32.inc

.data
str1 BYTE "This string changes color.",0
count = 4 ; 루프 횟수

.code
main PROC
    mov  ecx, count     ; 루프 카운터 설정
    mov  eax, 1         ; EAX를 초기 전경색 값으로 사용 (1 = Blue)

L1:
    call SetTextColor   ; EAX 레지스터 값으로 텍스트 색상 설정
    
    mov  edx, OFFSET str1
    call WriteString    ; 문자열 출력
    call CrLf           ; 줄바꿈

    add  eax, 1         ; 다음 색상 (EAX 값을 1씩 증가)
    loop L1

    call WaitMsg        ; 종료 전 대기
    exit
main ENDP
END main
