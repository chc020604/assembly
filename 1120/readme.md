# 8장 Advanced Procedures

## Stack Frames
* **Stack에서 parameter 접근 할 떄는 BP기준으로 +이고 Local 변수는 -이다.**
### Stack Parameters
* Parameter: 매개변수
> 함수 정의 할 때
* Arguments: 인수, 인자
> 함수 호충 할 때

* Procedure(절차 즉, 함수) 실행 중간에 다른 Procedure를 호출해서 써야할 때 실행 되고 있던 Procedure의 정보들을 대피 시켜두는(저장시켜두는) 공간
> Stack

* Stack에 관련된 레지스터
  * CS
  * BP(Base Pointer)
  * SP(Stack Pointer)

### Disadvantages of Register Parameters
* Procedure를 정의 할 때 레지스터로도 할 수는 있지만 가급적 하지 말아야 한다.
> push, pop 계속 하는게 번거롭기 때문에

* call by value : Procedure를 호출 할 때 값을 전달 할 때
* call by reference: Procedure를 호출 할 때 주소를 전달 할 때

### Accessing Stack Parameters
* AddTwo Example 내용은 외워라
  
```assembly
int AddTwo(int x, int y)
{
    retturn x + y;
}

AddTwo PROC
    push ebp                >
    mov ebp,esp             >
    mov eax, [ebp + 12]
    add eax, [ebp + 8]
    pop ebp
    ret
AddTwo ENDP
```
* \>가 적힌 부분은 main 함수 실행중에 AddTwo 함수를 호출하면 자동으로 실행한다. 

### Clean Up the stack 
* 기준이 되는 값은 무조건 BP(Base Pointer)에 들어있다.
* 레지스터를 이용해서 프로그래밍하면 push를 해주면 반드시 pop해줘야 한다.

### Local Variables
* **암기 하쇼**

### Reference Parameters
* 파란 글씨가 ArrayFill Example Procedure에 대한 한줄 설명임

## Recursion
**재귀**
* Endless Recursion에 있는 코드는 끝나지않는 함수를 나타냄

### Recursively Calculating a Sum
* 54321 순서대로 읽는 함수
  
> **Procedure를 호출하면 무조건 Stack Frame을 만든다. 기준은 BP이다.**
> **Recursion 됐을때는 SP 가리키는 아래에 Stack Frame을 만들어 나간다.**

## INVOKE, ADDR, PROC and PROTO
* 어셈블러에게 지시하는 명령문들임.

### INVOKE Directive

### ADDR Operator
* ADDR은 무조건 INVOKE 다음에 온다.

**Stack에서 parameter 접근 할 떄는 BP기준으로 +이고 Local 변수는 -이다.**

### WriteStackFrame Procedure
* Stack Frame이 어떻게 구성되어있는지 확인하고 싶으면 이걸 쓴다.
  
### Hiding and Exporting Procedure Names
```
mySub PROC PRIVATE
```
* 다른 곳에서 이 Procedure를 호출하지 못하게 Private로 만들 수 있다.

### Calling External Procedures
* 다른 곳에 있는 Procedure를 지정,사용할때 사용한다.

### Exporting Variables and Symbols
* 외부에서(다른파일에서) 이 변수를 사용할 수 있게 할 때(허용 할 때) 사용한다.
  

