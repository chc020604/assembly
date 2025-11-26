# **8.10.2 Algorithm Workbench & 8.11 Programming Exercises**

## **1\. Stack Frame Visualization (스택 프레임 시각화)**

**Q: Here is a calling sequence for a procedure named AddThree that adds three doublewords (assume that the STDCALL calling convention is used):**

push 10h  
push 20h  
push 30h  
call AddThree

Draw a picture of the procedure’s stack frame immediately after EBP has been pushed on the runtime stack.  
(Q: 세 개의 더블워드를 더하는 AddThree라는 프로시저의 호출 순서가 위와 같습니다(STDCALL 호출 규약을 사용한다고 가정). EBP가 런타임 스택에 푸시된 직후 프로시저의 스택 프레임 그림을 그리십시오.)

* **답 (Answer):**

\-----------------  \<-- High Memory Address  
|           10h     	    |  \[EBP \+ 16\] (Third Parameter)  
\-----------------  
|           20h     	    |  \[EBP \+ 12\] (Second Parameter)  
\-----------------  
|          30h      	    |  \[EBP \+ 8\]  (First Parameter)  
\-----------------  
| Return Address|  \[EBP \+ 4\]  
\-----------------  
|    Saved EBP     |  \<-- EBP points here (ESP points here)  
\-----------------  \<-- Low Memory Address

* 풀이 (Explanation):  
  제공된 코드에서 push 명령어의 순서대로 스택에 값이 쌓입니다. 스택은 높은 주소에서 낮은 주소로 자라나므로, 가장 먼저 푸시된 10h가 가장 높은 주소에 위치하고, 30h가 리턴 주소 바로 위에 위치하게 됩니다. call 명령어는 리턴 주소를 푸시하고, 프로시저 내부의 push ebp가 실행되면 현재 ESP가 가리키는 곳에 이전 EBP가 저장됩니다.

## **2\. AddThree Procedure (AddThree 프로시저 생성)**

Q: Create a procedure named AddThree that receives three integer parameters and calculates and returns their sum in the EAX register.  
(Q: 세 개의 정수 매개변수를 받아 합계를 계산하고 EAX 레지스터에 반환하는 AddThree라는 프로시저를 만드십시오.)

* **답 (Answer):**

AddThree PROC,  
    val1:DWORD, val2:DWORD, val3:DWORD

    mov eax, val1  
    add eax, val2  
    add eax, val3  
    ret  
AddThree ENDP

* 풀이 (Explanation):  
  MASM의 PROC 지시어에서 매개변수 리스트를 정의하면 어셈블러가 자동으로 스택 프레임 코드를 생성해 줍니다. 계산된 합계는 관례적으로 EAX 레지스터에 저장하여 반환합니다.

## **3\. Local Pointer Variable (지역 포인터 변수 선언)**

Q: Declare a local variable named pArray that is a pointer to an array of doublewords.  
(Q: 더블워드 배열에 대한 포인터인 pArray라는 지역 변수를 선언하십시오.)

* **답 (Answer):**

LOCAL pArray:PTR DWORD

* 풀이 (Explanation):  
  LOCAL 지시어를 사용하여 프로시저 내에서 지역 변수를 선언합니다. 포인터 타입은 PTR 키워드와 가리키는 데이터 타입(DWORD)을 함께 사용하여 정의합니다.

## **4\. Local Byte Array (지역 바이트 배열 선언)**

Q: Declare a local variable named buffer that is an array of 20 bytes.  
(Q: 20바이트 배열인 buffer라는 지역 변수를 선언하십시오.)

* **답 (Answer):**

LOCAL buffer\[20\]:BYTE

* 풀이 (Explanation):  
  지역 배열 변수는 이름\[크기\]:타입 형식으로 선언합니다. 여기서는 20개의 요소를 가진 BYTE 타입 배열을 선언했습니다.

## **5\. Local Pointer to Word (워드 포인터 지역 변수 선언)**

Q: Declare a local variable named pwArray that points to a 16-bit unsigned integer.  
(Q: 16비트 부호 없는 정수를 가리키는 pwArray라는 지역 변수를 선언하십시오.)

* **답 (Answer):**

LOCAL pwArray:PTR WORD

* 풀이 (Explanation):  
  16비트 정수는 WORD 타입입니다. 따라서 WORD를 가리키는 포인터는 PTR WORD로 선언합니다.

## **6\. Local Signed Byte (부호 있는 바이트 지역 변수 선언)**

Q: Declare a local variable named myByte that holds an 8-bit signed integer.  
(Q: 8비트 부호 있는 정수를 저장하는 myByte라는 지역 변수를 선언하십시오.)

* **답 (Answer):**

LOCAL myByte:SBYTE

* 풀이 (Explanation):  
  8비트 부호 있는 정수는 SBYTE (Signed Byte) 타입을 사용합니다.

## **7\. Local Doubleword Array (더블워드 지역 배열 선언)**

Q: Declare a local variable named myArray that is an array of 20 doublewords.  
(Q: 20개의 더블워드 배열인 myArray라는 지역 변수를 선언하십시오.)

* **답 (Answer):**

LOCAL myArray\[20\]:DWORD

* 풀이 (Explanation):  
  20개의 요소를 가진 DWORD (32비트 정수) 타입 배열을 선언합니다.

## **8\. SetColor Procedure (SetColor 프로시저 생성)**

Q: Create a procedure named SetColor that receives two stack parameters: forecolor and backcolor, and calls the SetTextColor procedure from the Irvine32 library.  
(Q: forecolor와 backcolor라는 두 개의 스택 매개변수를 받고 Irvine32 라이브러리의 SetTextColor 프로시저를 호출하는 SetColor라는 프로시저를 만드십시오.)

* **답 (Answer):**

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

* 풀이 (Explanation):  
  Irvine32 라이브러리의 SetTextColor는 EAX 레지스터 하나에 8비트 색상 정보를 받습니다. 하위 4비트는 전경색, 상위 4비트는 4비트 합니다.o하고 9\. WriteColorChar Procedure (WriteColorChar 프로시저 생성)는  
  Q: Create a procedure named WriteColorChar that receives three stack parameters: char, forecolor, and backcolor. It displays a single character, using the color attributes specified in forecolor and backcolor.  
  (Q: char, forecolor, backcolor 세 개의 스택 매개변수를 받는 WriteColorChar 프로시저를 만드십시오. 이 프로시저는 지정된 전경색과 배경색 속성을 사용하여 단일 문자를 표시합니다.)  
  **답 (Answer):**

WriteColorChar PROC USES eax,  
    char:BYTE,   
    forecolor:DWORD,   
    backcolor:DWORD

    ; 1\. 색상 설정 (SetColor 로직과 동일)  
    mov eax, backcolor  
    shl eax, 4  
    or  eax, forecolor  
    call SetTextColor

    ; 2\. 문자 출력  
    movzx eax, char     ; AL에 문자를 로드하고 상위 비트는 0으로 확장  
    call WriteChar

    ret  
WriteColorChar ENDP

* 0으로 확장l WriteChar

  ret  
  WriteColorChar ENDP

## **10\.**

* 풀이 (Explanation):  
  먼저 SetTextColor를 호출하여 콘솔 색상을 설정한 뒤, WriteChar를 호출하여 문자를 출력합니다. WriteChar는 A10. DumpMemory Procedure (DumpMemory 프로시저 작성)  
  Q: Write a procedure named DumpMemory that encapsulates the DumpMem procedure in the Irvine32 library. Use declared parameters and the USES directive. The following is an example of how it should be called: INVOKE DumpMemory, OFFSET array, LENGTHOF array, TYPE array.  
  (Q: Irvine32 라이브러리의 DumpMem 프로시저를 캡슐화하는 DumpMemory라는 프로시저를 작성하십시오. 선언된 매개변수와 USES 지시어를 사용하십시오. 호출 예시는 위와 같습니다.)i  
  * **답 (Answer):**

DumpMemory PROC USES esi ebx ecx,  
    address:DWORD,      ; 데이터의 시작 주소 (OFFSET)  
    units:DWORD,        ; 요소의 개수 (LENGTHOF)  
    unitType:DWORD      ; 요소의 크기 (TYPE)

    mov esi, address    ; ESI \= 시작 주소  
    mov ecx, units      ; ECX \= 개수  
    mov ebx, unitType   ; EBX \= 단위 크기 (1=Byte, 2=Word, 4=Dword)  
ne32 라이브러리의 DumpMem 프로시저를 캡슐화하는 DumpMemory라는 프로시저를 작성하십시오. 선
