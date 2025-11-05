INCLUDE Irvine32.inc

;-----------------------------------------------------
GenerateRandomString PROC
;
; EAX 길이의 무작위 대문자 문자열을 ESI가 가리키는
; 버퍼에 생성합니다.
; 입력: EAX = 길이(L), ESI = 버퍼 포인터
; 출력: ESI가 가리키는 버퍼가 채워짐 (NULL 종료)
;-----------------------------------------------------
    push ecx            ; 루프 카운터
    push eax            ; EAX 보존 (RandomRange용)
    push edx            ; EDX 보존 (RandomRange용)

    mov  ecx, eax       ; ECX = L (루프 카운터)

L1:
    mov  eax, 26        ; EAX = 0 ~ 25 범위
    call RandomRange
    add  al, 'A'        ; AL = 'A' ~ 'Z'
    mov  [esi], al      ; 버퍼에 저장
    inc  esi            ; 포인터 증가
    loop L1

    mov  BYTE PTR [esi], 0 ; 문자열 끝에 NULL 추가

    pop  edx
    pop  eax
    pop  ecx
    ret
GenerateRandomString ENDP

.data
testCount = 20
strLength = 15
randString BYTE strLength + 1 DUP(?) ; 15자 + NULL

.code
main PROC
    call Randomize

    mov  ecx, testCount ; 20번 테스트

L1:
    mov  eax, strLength
    mov  esi, OFFSET randString
    call GenerateRandomString

    mov  edx, OFFSET randString
    call WriteString
    call Crlf

    loop L1

    call WaitMsg
    exit
main ENDP
END main
