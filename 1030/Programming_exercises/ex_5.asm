INCLUDE Irvine32.inc

;-----------------------------------------------------
BetterRandomRange PROC
;
; M(EBX)과 N-1(EAX) 사이의 난수를 생성합니다.
; 입력: EBX = M (하한), EAX = N (상한+1)
; 출력: EAX = 난수
;-----------------------------------------------------
    push ebx            ; EBX 보존
    push edx            ; RandomRange가 EDX를 사용하므로 보존

    sub  eax, ebx       ; EAX = N - M (범위의 크기)
    call RandomRange    ; EAX = 0 ~ (N-M)-1
    add  eax, ebx       ; EAX = M ~ N-1

    pop  edx
    pop  ebx
    ret
BetterRandomRange ENDP

.data
lowerBound SDEC -300
upperBound SDEC 100
count = 50

.code
main PROC
    call Randomize      ; 난수 시드 초기화

    mov  ecx, count     ; 50번 반복

L1:
    mov  ebx, lowerBound ; EBX = -300 (M)
    mov  eax, upperBound ; EAX = 100 (N)
    call BetterRandomRange ; EAX = -300 ~ 99

    call WriteInt       ; 난수 출력
    call Crlf

    loop L1

    call WaitMsg
    exit
main ENDP
END main
