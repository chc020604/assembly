# 8장 Advanced Procedures

## Stack Frames

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
  
'''assembly
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
'''
* \>가 적힌 부분은 main 함수 실행중에 AddTwo 함수를 호출하면 자동으로 실행한다. 

### Clean Up the stack 
* 기준이 되는 값은 무조건 BP(Base Pointer)에 들어있다.
* 레지스터를 이용해서 프로그래밍하면 push를 해주면 반드시 pop해줘야 한다.

### Local Variables
* **암기 하쇼**





