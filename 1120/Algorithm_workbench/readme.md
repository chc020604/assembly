### Q1: Here is a calling sequence for a procedure named AddThree that adds three doublewords (assume that the STDCALL calling convention is used):

push 10h  
push 20h  
push 30h  
call AddThree

Draw a picture of the procedure’s stack frame immediately after EBP has been pushed on the runtime stack.  
(세 개의 더블워드를 더하는 AddThree라는 프로시저의 호출 순서가 위와 같습니다(STDCALL 호출 규약을 사용한다고 가정). EBP가 런타임 스택에 푸시된 직후 프로시저의 스택 프레임 그림을 그리십시오.)

* 답:
```
-----------------  <-- High Memory Address  
|       10h     |  [EBP \+ 16\] (Third Parameter)  
-----------------  
|      20h      |  [EBP \+ 12\] (Second Parameter)  
-----------------  
|      30h      |  [EBP \+ 8\]  (First Parameter)  
-----------------  
| Return Address|  [EBP \+ 4\]  
-----------------  
|    Saved EBP  |  <-- EBP points here (ESP points here)  
-----------------  <-- Low Memory Address
```
### Q2: Create a procedure named AddThree that receives three integer parameters and calculates and returns their sum in the EAX register.  
(세 개의 정수 매개변수를 받아 합계를 계산하고 EAX 레지스터에 반환하는 AddThree라는 프로시저를 만드십시오.)

* **답:**
```asm
AddThree PROC,  
    val1:DWORD, val2:DWORD, val3:DWORD

    mov eax, val1  
    add eax, val2  
    add eax, val3  
    ret  
AddThree ENDP
```

### Q3: Declare a local variable named pArray that is a pointer to an array of doublewords.  
(더블워드 배열에 대한 포인터인 pArray라는 지역 변수를 선언하십시오.)

* **답:**
```ams
LOCAL pArray:PTR DWORD
```

### Q4: Declare a local variable named buffer that is an array of 20 bytes.  
(20바이트 배열인 buffer라는 지역 변수를 선언하십시오.)

* **답 (Answer):**
```asm
LOCAL buffer[20]:BYTE
```

### Q5: Declare a local variable named pwArray that points to a 16-bit unsigned integer.  
(16비트 부호 없는 정수를 가리키는 pwArray라는 지역 변수를 선언하십시오.)

* **답 (Answer):**
```
LOCAL pwArray:PTR WORD
```

### Q6: Declare a local variable named myByte that holds an 8-bit signed integer.  
(8비트 부호 있는 정수를 저장하는 myByte라는 지역 변수를 선언하십시오.)

* **답 (Answer):**
```
LOCAL myByte:SBYTE
```

### Q7: Declare a local variable named myArray that is an array of 20 doublewords.  
(20개의 더블워드 배열인 myArray라는 지역 변수를 선언하십시오.)

* **답 (Answer):**
```
LOCAL myArray[20]:DWORD
```

### Q8: Create a procedure named SetColor that receives two stack parameters: forecolor and backcolor, and calls the SetTextColor procedure from the Irvine32 library.  
(forecolor와 backcolor라는 두 개의 스택 매개변수를 받고 Irvine32 라이브러리의 SetTextColor 프로시저를 호출하는 SetColor라는 프로시저를 만드십시오.)

* **답 (Answer):**
```asm
SetColor PROC,  
    forecolor:DWORD,  
    backcolor:DWORD

    mov eax, backcolor  
    shl eax, 4          ; 배경색을 상위 4비트로 이동  
    or  eax, forecolor  ; 전경색(하위 4비트)과 결합  
    call SetTextColorr  eax, forecolor  ; 전경색과 결합  
    call SetTextColtTextColor  
    ret  
SetColor ENDP
```

### Q9: Create a procedure named WriteColorChar that receives three stack parameters: char, forecolor, and backcolor. It displays a single character, using the color attributes specified in forecolor and backcolor.  
(char, forecolor, backcolor 세 개의 스택 매개변수를 받는 WriteColorChar 프로시저를 만드십시오. 이 프로시저는 지정된 전경색과 배경색 속성을 사용하여 단일 문자를 표시합니다.)  

* **답 (Answer):**
```
WriteColorChar PROC USES eax,
    char:BYTE, 
    forecolor:DWORD, 
    backcolor:DWORD

    ; 1. 색상 설정 (SetColor 로직과 동일)
    mov eax, backcolor
    shl eax, 4
    or  eax, forecolor
    call SetTextColor

    ; 2. 문자 출력
    movzx eax, char     ; AL에 문자를 로드하고 상위 비트는 0으로 확장
    call WriteChar

    ret
WriteColorChar ENDP

```

### Q10: Write a procedure named DumpMemory that encapsulates the DumpMem procedure in the Irvine32 library. Use declared parameters and the USES directive. The following is an example of how it should be called: INVOKE DumpMemory, OFFSET array, LENGTHOF array, TYPE array.
(Irvine32 라이브러리의 DumpMem 프로시저를 캡슐화하는 DumpMemory라는 프로시저를 작성하십시오. 선언된 매개변수와 USES 지시어를 사용하십시오. 호출 예시는 다음과 같습니다: INVOKE DumpMemory, OFFSET array, LENGTHOF array, TYPE array.)

* **답 (Answer):**

```asm
DumpMemory PROC USES esi ebx ecx,
    address:DWORD,      ; 데이터의 시작 주소 (OFFSET)
    units:DWORD,        ; 요소의 개수 (LENGTHOF)
    unitType:DWORD      ; 요소의 크기 (TYPE)

    mov esi, address    ; ESI = 시작 주소
    mov ecx, units      ; ECX = 개수
    mov ebx, unitType   ; EBX = 단위 크기 (1=Byte, 2=Word, 4=Dword)
    call DumpMem
    ret
DumpMemory ENDP

```

Q11: Declare a procedure named MultArray that receives two pointers to arrays of doublewords, and a third parameter indicating the number of array elements. Also, create a PROTO declaration for this procedure.
(더블워드 배열에 대한 두 개의 포인터와 배열 요소의 수를 나타내는 세 번째 매개변수를 받는 MultArray라는 프로시저를 선언하십시오. 또한, 이 프로시저에 대한 PROTO 선언을 만드십시오.)

* **답 (Answer):**
  
  * PROTO선언
  ```asm
  MultArray PROTO,
      ptrArray1:PTR DWORD,
      ptrArray2:PTR DWORD,
      count:DWORD
  ```
* PROC 선언
```asm
MultArray PROC,
    ptrArray1:PTR DWORD,
    ptrArray2:PTR DWORD,
    count:DWORD
    
    ; (프로시저 본문 내용)
    
    ret
MultArray ENDP
```
