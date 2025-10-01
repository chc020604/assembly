1. Provide examples of three different instruction mnemonics.
	- MOV: 데이터를 이동(복사)합니다.
	- ADD: 두 값을 더합니다.
	- JMP: 특정 코드로 실행 흐름을 점프합니다.

2. What is a calling convention, and how is it used in assembly language declarations?
	답: 호출 규약은 함수(프로시저)를 호출할 때 매개변수를 전달하는 방법, 스택을 정리하는 주체, 반환 값을 처리하는 방식 등을 정한 규칙입니다. 어셈블리에서는 프로시저를 선언하는 PROC 지시어 뒤에 STDCALL, C 와 같은 키워드로 호출 규약을 명시하여 사용합니다.

3. How do you reserve space for the stack in a program?
	답: 스택 포인터 레지스터(ESP 또는 RSP)에서 필요한 공간의 크기만큼 값을 빼서 공간을 예약합니다.

4. Explain why the term assembler language is not quite correct.
	답: 어셈블러는 어셈블리 코드를 기계어로 번역하는 프로그램을 의미하고, 어셈블리가 프로그래밍 언어 자체를 의미하기 때문입니다. 따라서 '어셈블리 언어'가 더 정확한 표현입니다.

5. Explain the difference between big endian and little endian. Also, look up the origins of this term on the Web.

	답	: 차이점: 메모리에 여러 바이트로 구성된 데이터를 저장하는 순서의 차이입니다 / 걸리버 여행기에서 달걀을 깰 때 뭉툭한 큰 쪽으로 깨는 사람들과 뾰족한 작은 쪽으로 깨는 사람들 사이의 논쟁에서 유래했습니다.

6. Why might you use a symbolic constant rather than an integer literal in your code?

	답: 가독성: MAX_USERS와 같이 의미 있는 이름을 부여하여 코드의 이해를 돕습니다.

	답: 유지보수: 상수의 값을 변경해야 할 때, 정의된 한 곳만 수정하면 코드 전체에 반영되므로 편리합니다.

7. How is a source file different from a listing file?

	답: 소스 파일은 프로그래머가 직접 작성한 어셈블리 언어 원본 코드 파일입니다. 리스팅 파일은 어셈블러가 소스 파일을 처리한 후 생성하는 출력 파일로, 원본 코드와 함께 변환된 기계어 코드, 메모리 주소 등의 정보를 포함합니다.

8. How are data labels and code labels different?

	답: 데이터 레이블은 변수와 같이 데이터가 저장된 메모리의 위치를 나타내는 이름이고 코드 레이블은 JMP, CALL 등 분기 명령어의 목적지가 되는 명령어의 위치를 나타내는 이름입니다.

9. (True/False): An identifier cannot begin with a numeric digit.
	답: True

10. (True/False): A hexadecimal literal may be written as 0x3A.
	답: True

11. (True/False): Assembly language directives execute at runtime.
	답: False

12. (True/False): Assembly language directives can be written in any combination of uppercase and lowercase letters.
	답: True

13. Name the four basic parts of an assembly language instruction.
	답: 니모닉 (Mnemonic)

14. (True/False): MOV is an example of an instruction mnemonic.
답: True

15. (True/False): A code label is followed by a colon (:), but a data label does not end with a colon.
답: True

16. Show an example of a block comment.
	답: COMMENT 지시어를 사용합니다.
	'''
	COMMENT !
	이것은 여러 줄에 걸친
	블록 주석의 예입니다.
	!
	'''

17. Why is it not a good idea to use numeric addresses when writing instructions that access variables?
	답: 프로그램이 메모리의 어느 위치에 로드될지 예측할 수 없으므로 고정된 숫자 주소는 틀릴 가능성이 높습니다. 대신 심볼릭 레이블을 사용하면 링커가 정확한 주소를 자동으로 계산해주어 코드를 재배치 가능하게 만듭니다.

18. What type of argument must be passed to the ExitProcess procedure?
	답: 프로세스의 종료 코드(exit code)로 사용될 32비트 부호 있는 정수(DWORD)를 전달해야 합니다.

19. Which directive ends a procedure?
	답: ENDP

20. In 32-bit mode, what is the purpose of the identifier in the END directive?
	답: 프로그램의 시작 지점(entry point), 즉 프로그램 실행이 시작될 코드 레이블을 지정하는 역할을 합니다.

21. What is the purpose of the PROTO directive?
	답: 프로시저(함수)의 원형(prototype)을 선언하여, 어셈블러가 해당 프로시저의 이름, 매개변수 등을 미리 파악하고 호출의 유효성을 검사할 수 있게 합니다.

22. (True/False): An Object file is produced by the Linker.
	답: False

23. (True/False): A Listing file is produced by the Assembler.
	답: True

24. (True/False): A link library is added to a program just before producing an Executable file.
	답: True

25. Which data directive creates a 32-bit signed integer variable?
	답: SDWORD (Signed Doubleword)

26. Which data directive creates a 16-bit signed integer variable?
	답: SWORD (Signed Word)

27. Which data directive creates a 64-bit unsigned integer variable?
	답: QWORD (Quadword)

28. Which data directive creates an 8-bit signed integer variable?
	답: SBYTE (Signed Byte)

29. Which data directive creates a 10-byte packed BCD variable?
	답: TBYTE (Ten Byte)
