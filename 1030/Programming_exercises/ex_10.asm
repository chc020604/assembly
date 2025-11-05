INCLUDE Irvine32.inc

;-----------------------------------------------------
GenerateFibonacci PROC
;
; ECX(N)개의 피보나치 수열을 ESI가 가리키는 배열에 저장
; 입력: ESI = 배열 포인터, ECX = N
;-----------------------------------------------------
    push eax
    push ebx
    push edx

    ; N=0 처리
    jecxz Done

    ; N=1 처리: F(1) = 1
    mov  DWORD PTR [esi], 1
    cmp  ecx, 1
    je   Done
    
    ; N >= 2 처리: F(2) = 1
    mov  DWORD PTR [esi+4], 1
    cmp  ecx, 2
    je   Done
    
    ; N >= 3 처리 (루프 진입)
    mov  eax, 1             ; F(n-2) (초기값 F(1))
    mov  ebx, 1             ; F(n-1) (초기값 F(2))
    add  esi, 8             ; 배열 포인터를 F(3) 위치로 이동
    sub  ecx, 2             ; F(1), F(2) 2개 처리했음

L1:
    mov  edx, eax           ; EDX = F(n-2)
    add  edx, ebx           ; EDX = F(n-1) + F(n-2) = F(n)
    
    mov  [esi], edx         ; 배열에 F(n) 저장
    add  esi, 4             ; 다음 배열 위치
    
    mov  eax, ebx           ; F(n-2) = F(n-1)
    mov  ebx, edx           ; F(n-1) = F(n)
    
    loop L1

Done:
    pop  edx
    pop  ebx
    pop  eax
    ret
GenerateFibonacci ENDP

.data
N = 47
fibArray DWORD N DUP(?)

.code
main PROC
    mov  esi, OFFSET fibArray
    mov  ecx, N
    call GenerateFibonacci

    ; 프로그램 종료
    ; 디버거의 '메모리' 창에서 fibArray 주소를 확인하여
    ; 마지막 값 [fibArray + (47-1)*4]이
    ; 0B11924E1h (2,971,215,073)인지 확인
    exit
main ENDP
END main
