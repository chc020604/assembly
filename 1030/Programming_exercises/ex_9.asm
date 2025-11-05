INCLUDE Irvine32.inc

.data
g_counter DWORD 0   ; 재귀 호출 횟수 카운터

.code
;-----------------------------------------------------
RecursiveProc PROC
;
; ECX 횟수만큼 재귀적으로 자신을 호출합니다.
; 'LOOP' 명령어를 사용하여 재귀를 제어합니다.
;-----------------------------------------------------
    jecxz EndRecurse    ; 기본 케이스: ECX == 0 이면 종료

    inc  g_counter      ; 카운터 증가

    ; LOOP 명령어는 ECX를 1 감소시키고, 0이 아니면 점프
    loop DoCall         ; ECX가 1이었으면 여기서 0이 되고, 점프 안함
    
    ret                 ; ECX가 1 -> 0이 되어 점프하지 않은 경우

DoCall:
    call RecursiveProc  ; 재귀 호출

EndRecurse:
    ret
RecursiveProc ENDP

;-----------------------------------------------------
main PROC
    mov  ecx, 5         ; 5번 재귀하도록 설정
    call RecursiveProc

    ; 프로그램 종료 (디버거에서 g_counter 값 5 확인)
    exit
main ENDP
END main
