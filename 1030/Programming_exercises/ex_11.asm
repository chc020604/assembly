INCLUDE Irvine32.inc

;-----------------------------------------------------
FindMultiples PROC
;
; ESI가 가리키는 배열(크기 ECX=N)에서
; 인덱스가 EBX(K)의 배수인 항목을 1로 설정합니다.
; 입력: ESI = 배열, ECX = N, EBX = K
;-----------------------------------------------------
    push eax
    push edx
    push ecx            ; 루프 카운터용 ECX 보존

    mov  eax, 0         ; EAX = i (현재 인덱스)

L1:
    cmp  eax, ecx       ; i < N 비교
    jnb  Done           ; i >= N 이면 종료

    ; i % K 연산
    push eax            ; DIV는 EAX를 변경하므로 i 값 보존
    mov  edx, 0         ; EDX:EAX / EBX
    div  ebx            ; EAX = 몫, EDX = 나머지
    
    cmp  edx, 0         ; 나머지 == 0 인가?
    pop  eax            ; i 값 복원
    jne  NotMultiple    ; 0이 아니면 배수가 아님

    ; K의 배수인 경우
    mov  BYTE PTR [esi + eax], 1 ; array[i] = 1

NotMultiple:
    inc  eax            ; i++
    jmp  L1

Done:
    pop  ecx
    pop  edx
    pop  eax
    ret
FindMultiples ENDP


.data
N = 50
myArray BYTE N DUP(?)

.code
main PROC
    ; 1. 배열을 0으로 초기화
    mov  edi, OFFSET myArray
    mov  ecx, N
    mov  al, 0
    cld                 ; 방향 플래그 (순방향)
    rep  stosb          ; [EDI]에 AL 저장, ECX번 반복

    ; 2. K = 2 호출
    mov  esi, OFFSET myArray
    mov  ecx, N
    mov  ebx, 2
    call FindMultiples

    ; 3. K = 3 호출 (기존 배열에 덮어씀)
    mov  esi, OFFSET myArray
    mov  ecx, N
    mov  ebx, 3
    call FindMultiples

    ; 프로그램 종료
    ; 디버거에서 myArray를 확인
    ; 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, ...
    ; (인덱스 0,2,3,4,6,8,9...가 1이 됨)
    exit
main ENDP
END main
