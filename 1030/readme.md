[5.Produre]

* **외울 세그먼트**
    1. 코드가들어가는 cs
    2. 데이터가 들어가는 gs
    3. 스택의 첫 주소를 가지고 있는 세그먼트: ss
    4. 뭐 하나더 있는데 나중에 찾아보기

* sp(Stack Pointer): 스택에 쌓인 데이터 맨위에 위치.
    - sp를 감소시키고 넣는지 증가시키고 넣는지 잘 보기 (그림에 따라 decrements인지 increments인지 달라진다.)
    - 스택은 push, pop : 각 기능이 어떻게 동작하는지 알기.

* sp(ESP)가 가져온 데이터는 보통 as(EAX)에 들어간다.

* 스택의 사용처
    1. Local Variable
    2. Register Saving
    3. Argument Passing
    4. Return Address Storage

* flag register의 내용을 stack에 넣고 뺄때는 PUSHFD, POPFD를 사용

***PUSHAD,PUSHA,POPAD,POPA 잘 모르겠음 다시 보기***

**프로시저를 실행중에 다른 명령을 처리하고 오고싶을때 pushad하고 끝내고 다시 돌아오려면 popad를 하면 된다.**

* loop때도 같다 
~~~
 mov ecx, 100 ; set outer loop count
L1: ; begin the outer loop
    push ecx ; save outer loop count
; --- INNER LOOP START ---
    mov ecx, 20 ; set inner loop count
L2: ; begin the inner loop
    ;
    ;
    loop L2 ; repeat the inner loop
; --- INNER LOOP END ---
    pop ecx ; restore outer loop count
    loop L1 ; repeat the outer loop
~~~
**loop1을 실행중에 ecx값을 stack에 push해놓고 loop2를 갔다가 pop으로 넣어둔 ecx값을 가지고 와서 돌아온다.**

* main 프로시저(proc)에는 ret(return)가 없지만 일반적인 proc에는 ret가 있다.

* JMP명령은 한 프로시저 안에서만 가능하다

~~~
SumOf PROC
    add eax, ebx    :eax에 ebx를 더한다
    add eax, ecx    :eax에 ecx를 더한다
    ret
Sumof ENDP
~~~
**eax+ebx+ecx를 eax에 결과가 들어가있다.**

***변수는 모두 stack에 저장되어있다.***

***다음 실행할 명령어주소는 ip에 저장을 한다***

* oprand는 3개가 있음: 수식의 값, 레지스터, 메모리(변수)

~~~
ArraySum PROC
        push esi            ; save ESI, ECX
        push ecx
        mov eax,0           ; set the sum to zero
L1:     add eax,[esi]       ; add each integer to sum
        add esi,TYPE DWORD  ; point to next integer
        loop L1             ; repeat for array size
        pop ecx             ; restore ECX, ESI
        pop esi
        ret                 ; sum is in EAX
ArraySum ENDP
~~~
**esi와 ecx를 push(루프를 돌고 다시 원래 값으로 돌아와야하기 때문에)하고 루프 돌고 pop으로 돌아옴**

* 리턴벨류는 보통 eax에 저장하는데 pop하면 바로 날라가기 때문에 조심해야한다.

* USES는 push, pop을 자동으로 해주는 명령어다.


~~~
ArraySum PROC
push esi
push ecx
mov eax,0 ; set the sum to zero
L1:
add eax,[esi] ; add each integer to sum
add esi,TYPE DWORD ; point to next integer
loop L1 ; repeat for array size
pop ecx
pop esi
ret
ArraySum ENDP
~~~
**USES사용 하지 않았을때**

~~~
ArraySum PROC USES esi ecx
mov eax,0 ; set the sum to zero
L1:
add eax,[esi] ; add each integer to sum
add esi,TYPE DWORD ; point to next integer
loop L1 ; repeat for array size
ret ; sum is in EAX
ArraySum ENDP
~~~
**USES를 사용해서 push,pop 자동화 시켰을때**

***irvine32 Library를 사용하면 편함(설치필요)***

* 인터럽트 발표 준비
