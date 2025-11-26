# 8.10.1 Short Answer (단답형 문제 풀이)

### 1. Which statements belong in a procedure’s epilogue when the procedure has stack parameters and local variables? (스택 매개변수와 지역 변수가 있는 프로시저의 에필로그에는 어떤 문장들이 포함되어야 합니까?)
* 답:
  ```asm
  mov esp, ebp
  pop ebp
  ```

### 2. When a C function returns a 32-bit integer, where is the return value stored? (C 함수가 32비트 정수를 반환할 때, 반환 값은 어디에 저장됩니까?)
* 답: EAX 레지스터

### 3. How does a program using the STDCALL calling convention clean up the stack after a procedure call? (STDCALL 호출 규약을 사용하는 프로그램은 프로시저 호출 후 스택을 어떻게 정리합니까?)
* 답: 피호출자(Callee)가 반환할 때 스택을 정리합니다. (주로 RET n 명령어 사용)

### 4. How is the LEA instruction more powerful than the OFFSET operator? (LEA 명령어가 OFFSET 연산자보다 강력한 점은 무엇입니까?)
* 답: LEA는 런타임(실행 시간)에 주소를 계산할 수 있습니다.

### 5. In the C++ example shown in Section 8.2.3, how much stack space is used by a variable of type int? (8.2.3절에 표시된 C++ 예제에서 int 유형의 변수는 얼마나 많은 스택 공간을 사용합니까?)
* 답: 4 바이트 (32비트)

### 6. What advantages might the C calling convention have over the STDCALL calling convention? (C 호출 규약이 STDCALL 호출 규약보다 가질 수 있는 장점은 무엇입니까?)
* 답: 가변 인자(Variable Arguments) 함수를 지원할 수 있습니다.

### 7. (True/False): When using the PROC directive, all parameters must be listed on the same line. ((참/거짓): PROC 지시어를 사용할 때 모든 매개변수는 같은 줄에 나열되어야 합니다.)
* 답: False

### 8. (True/False): If you pass a variable containing the offset of an array of bytes to a procedure that expects a pointer to an array of words, the assembler will flag this as an error. ((참/거짓): 바이트 배열의 오프셋을 포함하는 변수를 워드 배열 포인터를 기대하는 프로시저에 전달하면, 어셈블러는 이를 오류로 표시합니까?)
* 답: False

### 9.(True/False): If you pass an immediate value to a procedure that expects a reference parameter, you can generate a general-protection fault. ((참/거짓): 참조 매개변수를 기대하는 프로시저에 즉시값(immediate value)을 전달하면 일반 보호 오류(General-Protection Fault)가 발생할 수 있습니다.)
* 답: True
  
