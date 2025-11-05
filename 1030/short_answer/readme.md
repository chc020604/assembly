1.  **Which instruction pushes all of the 32-bit general-purpose registers on the stack? (32비트 범용 레지스터 모두를 스택에 푸시하는 명령어는?)**
    > `PUSHAD`

2.  **Which instruction pushes the 32-bit EFLAGS register on the stack? (32비트 EFLAGS 레지스터를 스택에 푸시하는 명령어는?)**
    > `PUSHFD`

3.  **Which instruction pops the stack into the EFLAGS register? (스택에서 팝하여 EFLAGS 레지스터에 저장하는 명령어는?)**
    > `POPFD`

4.  **Challenge: Another assembler (called NASM) permits the PUSH instruction to list multiple specific registers. Why might this approach be better than the PUSHAD instruction in MASM? (Challenge: NASM 어셈블러는 PUSH 명령어에 여러 레지스터를 나열하는 것을 허용합니다. 이 방식이 MASM의 PUSHAD보다 더 나은 이유는 무엇일까요?)**
    > `PUSHAD`는 8개의 모든 범용 레지스터를 저장하지만, NASM 방식은 프로그래머가 **저장할 레지스터를 직접 선택**할 수 있습니다. 따라서 꼭 필요하지 않은 레지스터까지 저장하지 않아도 되므로 스택 공간과 실행 시간을 절약할 수 있어 **더 효율적입니다.**

5.  **Challenge: Suppose there were no PUSH instruction. Write a sequence of two other instructions that would accomplish the same as push eax. (Challenge: PUSH 명령어가 없다고 가정할 때, `push eax`와 동일한 작업을 수행하는 두 개의 다른 명령어 시퀀스를 작성하세요.)**
    > ```assembly
    > SUB ESP, 4
    > MOV [ESP], EAX
    > ```

6.  **(True/False): The RET instruction pops the top of the stack into the instruction pointer. (RET 명령어는 스택의 맨 위 값을 명령어 포인터(EIP)로 팝합니다.)**
    > **True (참)**. `CALL` 명령어가 스택에 푸시했던 반환 주소를 `RET`이 팝하여 `EIP`에 넣음으로써 원래 위치로 돌아갑니다.

7.  **(True/False): Nested procedure calls are not permitted by the Microsoft assembler unless the NESTED operator is used in the procedure definition. (NESTED 연산자를 사용하지 않으면 중첩 프로시저 호출이 허용되지 않습니다.)**
    > **False (거짓)**. 중첩 프로시저 호출은 어셈블리에서 기본적으로 허용됩니다. `NESTED` 연산자는 프레임 포인터와 관련된 다른 용도로 사용됩니다.

8.  **(True/False): In protected mode, each procedure call uses a minimum of 4 bytes of stack space. (보호 모드에서 각 프로시저 호출은 최소 4바이트의 스택 공간을 사용합니다.)**
    > **True (참)**. `CALL` 명령어는 최소한 32비트(4바이트) 크기의 반환 주소(`EIP`)를 스택에 푸시합니다.

9.  **(True/False): The ESI and EDI registers cannot be used when passing 32-bit parameters to procedures. (ESI와 EDI 레지스터는 32비트 매개변수를 프로시저에 전달할 때 사용할 수 없습니다.)**
    > **False (거짓)**. `ESI`, `EDI`를 포함한 모든 범용 레지스터는 매개변수를 전달하는 데 사용될 수 있습니다.

10. **(True/False): The ArraySum procedure (Section 5.2.5) receives a pointer to any array of doublewords. (ArraySum 프로시저(5.2.5절)는 doubleword 배열의 포인터를 받습니다.)**
    > **True (참)**. (제시된 섹션의 일반적인 `ArraySum` 구현을 가정할 때) `ESI`와 같은 레지스터를 통해 배열의 시작 주소(포인터)를 받습니다.

11. **(True/False): The USES operator lets you name all registers that are modified within a procedure. (USES 연산자는 프로시저 내에서 수정되는 모든 레지스터를 명시하게 해줍니다.)**
    > **True (참)**. `USES` 뒤에 나열된 레지스터들을 자동으로 `PUSH`하고 `POP` 하도록 MASM에게 알려(명시)줍니다.

12. **(True/False): The USES operator only generates PUSH instructions, so you must code POP instructions yourself. (USES 연산자는 PUSH 명령어만 생성하므로 POP 명령어는 직접 코딩해야 합니다.)**
    > **False (거짓)**. `USES`는 프로시저 시작 부분에 `PUSH`를, `RET` 직전에 `POP`을 (역순으로) 자동으로 생성합니다.

13. **(True/False): The register list in the USES directive must use commas to separate the register names. (USES 지시어의 레지스터 목록은 쉼표(,)를 사용하여 구분해야 합니다.)**
    > **False (거짓)**. `USES EAX EBX ECX`처럼 **공백**으로 구분합니다.

14. **Which statement(s) in the ArraySum procedure (Section 5.2.5) would have to be modified so it could accumulate an array of 16-bit words? (ArraySum 프로시저를 16비트(WORD) 배열을 처리하도록 수정하려면 어느 부분을 변경해야 합니까?)**
    > 두 부분을 수정해야 합니다.
    > * **데이터 이동:** `MOV EAX, [ESI]` (DWORD, 4바이트)를 `MOVSX EAX, WORD PTR [ESI]` (WORD, 2바이트)로 변경해야 합니다. (16비트 값을 32비트 `EAX`로 부호 확장하여 가져옵니다.)
    > * **포인터 증가:** `ADD ESI, 4` (DWORD 크기)를 `ADD ESI, 2` (WORD 크기)로 변경하여 다음 요소로 이동해야 합니다.

15. **What will be the final value in EAX after these instructions execute? (다음 코드 실행 후 EAX의 최종 값은?)**
    > * `push 5` (스택: 5)
    > * `push 6` (스택: 6, 5)
    > * `pop eax` (EAX = 6, 스택: 5)
    > * `pop eax` (EAX = 5, 스택: 비어있음)
    > * **답: 5**

16. **Which statement is true about what will happen when the example code runs? (다음 코드 실행 시 발생하는 현상으로 맞는 것은?)**
    > * `CALL Ex2Sub`가 실행되면 반환 주소(5행)가 스택에 푸시됩니다. (스택: [RetAddr], 20, 10)
    > * `Ex2Sub`의 `pop eax` (10행)는 스택의 맨 위 값, 즉 **반환 주소**를 `EAX`로 팝합니다.
    > * `ret` (11행)는 스택의 맨 위 값인 **20**을 팝하여 `EIP`에 넣습니다.
    > * 프로그램은 20번 주소로 점프하려고 시도하지만, 그곳은 유효한 코드가 아니므로 런타임 오류가 발생합니다.
    > * **답: d. The program will halt with a runtime error on Line 11 (11행에서 런타임 오류로 중단됩니다.)**

17. **Which statement is true about what will happen when the example code runs? (다음 코드 실행 시 발생하는 현상으로 맞는 것은?)**
    > * `EAX`는 30이 됩니다.
    > * `CALL Ex3Sub`가 실행되고(EAX=30), 반환 주소가 푸시됩니다.
    > * `pusha` (10행)가 실행되어 `EAX` (값 30)를 포함한 모든 레지스터를 스택에 저장합니다.
    > * `mov eax, 80` (11행)으로 `EAX`가 80이 됩니다.
    > * `popa` (12행)가 실행되어 `pusha`로 저장했던 모든 레지스터를 복원합니다. `EAX`는 80에서 다시 **30**으로 덮어써집니다.
    > * `ret` (13행)이 실행되어 `main`의 6행으로 돌아옵니다.
    > * `main`의 6행에 도달했을 때 `EAX`의 값은 30입니다.
    > * **답: c. EAX will equal 30 on line 6 (6행에서 EAX는 30이 됩니다.)**

18. **Which statement is true about what will happen when the example code runs? (다음 코드 실행 시 발생하는 현상으로 맞는 것은?)**
    > * `push offset Here` (3행)는 5행(`Here:`)의 주소를 스택에 푸시합니다.
    > * `jmp Ex4Sub` (4행)는 `Ex4Sub`로 점프합니다. (`CALL`이 아니므로 반환 주소를 푸시하지 않습니다.)
    > * `ret` (11행)는 스택의 맨 위 값, 즉 3행에서 푸시했던 `Here`의 주소를 팝하여 `EIP`에 넣습니다.
    > * 프로그램은 5행(`Here:`)으로 "복귀(점프)"합니다.
    > * `mov eax, 30` (6행)이 실행되어 `EAX`는 30이 됩니다.
    > * 7행(`INVOKE ExitProcess,0`)에 도달하여 프로그램이 종료됩니다.
    > * **답: a. EAX will equal 30 on line 7 (7행에서 EAX는 30이 됩니다.)**

19. **Which statement is true about what will happen when the example code runs? (다음 코드 실행 시 발생하는 현상으로 맞는 것은?)**
    > * `EDX=0`, `EAX=40`이 됩니다.
    > * `push eax` (4행)로 40을 푸시합니다. (스택: 40)
    > * `call Ex5Sub` (5행)로 반환 주소(6행)를 푸시합니다. (스택: [RetAddr], 40)
    > * `pop eax` (10행)로 `EAX`에 반환 주소([RetAddr])를 팝합니다. (스택: 40)
    > * `pop edx` (11행)로 `EDX`에 40을 팝합니다. (스택: 비어있음, **EDX = 40**)
    > * `push eax` (12행)로 `EAX`에 있던 반환 주소([RetAddr])를 다시 스택에 푸시합니다. (스택: [RetAddr])
    > * `ret` (13행)로 반환 주소를 팝하여 6행으로 복귀합니다.
    > * 6행에 도달했을 때 `EDX`의 값은 40입니다.
    > * **답: a. EDX will equal 40 on line 6 (6행에서 EDX는 40이 됩니다.)**

20. **What values will be written to the array when the following code executes? (다음 코드 실행 시 `array`에 기록되는 값들은?)**
    > 1.  `main`: `EAX=10`, `ESI=0`. `call proc_1`
    > 2.  `proc_1`: `call proc_2`
    > 3.  `proc_2`: `call proc_3`
    > 4.  `proc_3`: `mov array[esi], eax` (ESI=0, EAX=10) -> **`array[0] = 10`**. `ret`
    > 5.  `proc_2`: `add esi, 4` (ESI=4). `add eax, 10` (EAX=20). `mov array[esi], eax` -> **`array[1] = 20`**. `ret`
    > 6.  `proc_1`: `add esi, 4` (ESI=8). `add eax, 10` (EAX=30). `mov array[esi], eax` -> **`array[2] = 30`**. `ret`
    > 7.  `main`: `add esi, 4` (ESI=12). `add eax, 10` (EAX=40). `mov array[esi], eax` -> **`array[3] = 40`**.
    > * **최종 배열 값: 10, 20, 30, 40**
