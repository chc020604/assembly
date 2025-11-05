INCLUDE Irvine32.inc

.data
startVal DWORD 1
chars BYTE  "HACEBDFG"
links DWORD 0, 4, 5, 6, 2, 3, 7, 0
count = LENGTHOF chars
result BYTE count DUP(?), 0  ; 결과를 저장할 버퍼 (NULL 종료)

.code
main PROC
    mov  ecx, count             ; 루프 카운터 (총 8개)
    mov  ebx, startVal          ; EBX = 현재 인덱스 (시작값 1)
    mov  edi, OFFSET result     ; EDI = 결과 배열 포인터

L1:
    ; 1. EBX(인덱스)를 사용해 chars에서 문자 가져오기
    mov  esi, OFFSET chars
    mov  al, [esi + ebx]
    
    ; 2. 가져온 문자를 result 배열에 저장
    mov  [edi], al
    inc  edi                    ; 결과 포인터 증가

    ; 3. EBX(인덱스)를 사용해 links에서 다음 인덱스 가져오기
    ;    (links는 DWORD 배열이므로 * 4)
    mov  esi, OFFSET links
    mov  ebx, [esi + ebx * 4]
    
    loop L1

    ; 결과 출력
    mov  edx, OFFSET result
    call WriteString
    call CrLf

    call WaitMsg
    exit
main ENDP
END main
