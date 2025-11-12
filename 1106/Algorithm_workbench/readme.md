### 1. Write a sequence of statements that use only PUSH and POP instructions to exchange the values in the EAX and EBX registers (PUSH와 POP 명령어만을 사용하여 EAX와 EBX 레지스터의 값을 교환하는 일련의 명령어를 작성하시오.)

> 스택의 **LIFO(Last-In, First-Out)** 특성을 이용하여 두 값을 교환합니다.

```assembly
; 32비트 (EAX, EBX)
PUSH EAX  ; EAX 값을 스택에 저장 (스택: [EAX])
PUSH EBX  ; EBX 값을 스택에 저장 (스택: [EBX, EAX])
POP  EAX  ; 스택 최상단(EBX 값)을 EAX로 팝 (EAX = EBX)
POP  EBX  ; 스택 다음 값(원래 EAX 값)을 EBX로 팝 (EBX = EAX)

; 64비트 (RAX, RBX)
; PUSH RAX
; PUSH RBX
; POP  RAX
; POP  RBX
```
2. Suppose you wanted a subroutine to return to an address that was 3 bytes higher in memory... (서브루틴이 스택의 현재 반환 주소보다 메모리상 3바이트 높은 주소로 반환되도록 하는 명령어를 작성하시오.)
> RET 명령어는 실행되기 직전 스택 포인터(ESP 또는 RSP)가 가리키는 곳의 주소로 점프합니다. 따라서 RET 직전에 스택에 저장된 반환 주소 값 자체를 직접 수정합니다.

```assembly
; 32비트 (RET 명령어 직전에 삽입)
ADD DWORD PTR [ESP], 3  ; 스택 최상단(반환 주소)에 3을 더함
RET

; 64비트 (RET 명령어 직전에 삽입)
; ADD QWORD PTR [RSP], 3
; RET
```

3. ...reserve space for two integer doubleword variables. ...assign the values 1000h and 2000h... (두 개의 더블워드 정수형 지역 변수를 위한 공간을 예약하고, 이 변수에 1000h와 2000h 값을 할당하는 명령어를 작성하시오.)
> 일반적인 프로시저 프롤로그(PUSH EBP, MOV EBP, ESP)가 실행된 후, SUB ESP, 8을 사용하여 스택에 8바이트(2 * 4바이트 더블워드) 공간을 예약합니다. 이 공간은 베이스 포인터(EBP)를 기준으로 [EBP-4]와 [EBP-8]을 통해 접근할 수 있습니다.

```assembly
; 서브루틴 시작 부분 (PUSH EBP / MOV EBP, ESP 직후)
SUB ESP, 8              ; 2 * 4바이트(더블워드) 공간 예약

; 지역 변수에 값 할당 (EBP 기준)
MOV DWORD PTR [EBP-4], 1000h ; 첫 번째 지역 변수
MOV DWORD PTR [EBP-8], 2000h ; 두 번째 지역 변수

; 64비트 참고:
; SUB RSP, 8                 ; 문제에서 'doubleword'(DWORD)를 명시
; MOV DWORD PTR [RBP-4], 1000h
; MOV DWORD PTR [RBP-8], 2000h
```

4. Write a sequence of statements using indexed addressing that copies an element in a doubleword array to the previous position... (인덱스 주소 지정을 사용하여 더블워드 배열의 한 요소를 동일 배열의 이전 위치로 복사하는 일련의 명령어를 작성하시오.)
> [base + index * scale] 형태의 인덱스 주소 지정을 사용합니다. k번째 요소를 k-1번째 위치로 복사합니다. (배열 요소가 DWORD이므로 scale은 4입니다.)

```assembly
.data
myArray DWORD 10h, 20h, 30h, 40h, 50h, 60h
.code
; ESI에 배열 주소, ECX에 인덱스 k (k >= 1)가 있다고 가정
MOV ESI, OFFSET myArray
MOV ECX, 3              ; 예: 인덱스 3 (값 40h)을

; 1. EAX에 [k] 요소 로드
; EAX = [ESI + ECX * 4]
MOV EAX, [ESI + ECX * 4]  ; EAX = myArray[3] (40h)

; 2. EAX 값을 [k-1] 위치에 저장
; [k-1]의 주소는 [ESI + (ECX-1) * 4] 또는 [ESI + ECX*4 - 4]
MOV [ESI + ECX * 4 - 4], EAX ; myArray[2] = EAX (40h)

; 64비트 참고:
; MOV RSI, OFFSET myArray
; MOV RCX, 3
; MOV EAX, [RSI + RCX * 4]      ; DWORD 배열이므로 EAX와 *4 사용
; MOV [RSI + RCX * 4 - 4], EAX
```

5. Write a sequence of statements that display a subroutine’s return address... (서브루틴이 호출자로 정상 반환하는 것을 방해하지 않으면서 서브루틴의 반환 주소를 출력하는 일련의 명령어를 작성하시오.)
> 표준 스택 프레임(PUSH EBP, MOV EBP, ESP)을 사용한다고 가정할 때, 서브루틴을 호출한 CALL 명령어의 다음 주소(즉, 반환 주소)는 [EBP+4]에 저장됩니다. 이 값을 레지스터로 읽어와 출력 함수로 표시합니다. 스택 프레임 자체를 변경하지 않으므로 RET는 정상 동작합니다.

(Irvine32 라이브러리의 WriteHex 함수를 사용한다고 가정)

```assembly
MySub PROC
    PUSH EBP
    MOV EBP, ESP
    ; ... 기타 서브루틴 코드 ...

    ; EBP+4 위치(반환 주소)의 값을 EAX로 로드
    MOV EAX, [EBP+4]

    ; EAX(반환 주소)를 16진수로 출력
    ; (WriteHex는 EAX 외 레지스터를 보존한다고 가정)
    CALL WriteHex

    ; ... 기타 서브루틴 코드 ...

    ; 표준 에필로그 (스택 복원)
    POP EBP
    RET
MySub ENDP
```
