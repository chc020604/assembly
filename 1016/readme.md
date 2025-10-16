* NOTEBOOK LM - ai
* 토요일 2시에 학교로

***Part4***
* 플래그 레지스터는 비트 각각의 역할이 있다. (레지스터 비트 종류를 외워야한다,)
  
* 어셈블리 명령어는 메모리에 있는 내용을 cpu로 가져와서 실행한다.
* cpu가 고려해야할 저장장치는 두 군데이다 ( 레지스터, 주기억장치 )
* AX, DX, CX, DX => 범용 레지스터 (16비트 레지스터)
* 8비트 레지스터 => AH,AL (AX를 반으로 나눈 두개)... 다른 BH,BL 등등도 같음
* segment register => CS, DS, SS, ES, FS, GS ( 외워야함 ) - 레지스터 종류

* 어셈블리어에서 변수 선언 방법: .data ~~~를 하면 된다.
  ~~~
  .data
  var BYTE 10h
  var2 WORD ?
  ~~~
***MOV Instruction***
* memory to memory 명령은 불가하다. (가능한것도 있긴함)
* IP: instruction point - 다음 주소를 담고있는 곳

***Overlapping Value***
* EAX : 32bit
* BYTE, WORD, DWORD(Double Word)
* 덮어쓰기가 가능하다.

***Zero/Sign Extension of Integers***
~~~
.data
count WORD 1
.code
move ecx, 0
mov cx,count
~~~
* ecx에 count를 넣으면 오류가 난다 => count는 크기가 WORD이고 ecx는 32비트이기 때문에 일치 하지 않기 때문

***MOVZX Instruction***
* MOV는 무조건 같은 크기여야 하지만 MOCZX는 설정한 값에 대하여 넣기가 가능하다
* 빈 공간은 전부 0으로 채운다.
~~~
MOVZX reg32, reg/mem8   =>  32비트 레지스터에 8bit를 넣고 왼쪽을 전부 0으로 채운다.
MOVZX reg32, reg/mem16  =>  32비트 레지스터에 16bit를 넣고 왼쪽을 전부 0으로 채운다. 
MOVZX reg16, reg/mem8   =>  16비트 레지스터에 8bit를 넣고 왼쪽을 전부 0으로 채운다.
~~~

***MOVSX Instruction***
* MOVZX는 무조건 왼쪽을 0으로 채우지만 MOVSX는 SIGN비트에 따라 0,1 둘중에 하나로 채워진다.

***LAHF and SAHF Instruction***
* LAHF ( Load AH Flag register ) => 플래그 레지스터의 모든 비트를 AH 레지스터에 복사하는 것.
* SAHF ( Store AH Flag register ) => AH 레지스터의 값을 플래그 레지스터에 저장.

***XCHG Instruction***
* swap명령어.
* memory to memory가 불가능 하기 때문에 register를 이용해서 swap을 한다.
  
~~~
.data
val1 WORD 2
val2 WORD 1

XCHG val1, val2 => 이건 메모리 to 메모리이기 때문에 안된다.

MOV ax, val1
xchg ax, val2
MOV val, ax
이렇게 두 변수 값을 변경을 해야한다.
~~~

***Direct-Offset Operands***
~~~
arrayB BYTE 10h, 20h, 30h, 40h, 50h

MOV al, arrayB    ; AX = 10h
MOV al, [arrayB+1]; AX = 20h  => +1은 주소 다음번지를 가리킨다.
MOV al, [arrayB+2]; AX = 30h
~~~

* 기계 안에는 1더하는 명령어인 INC가 있고 ADD가 있다 ( 둘 중에 누가 더 빠른지 알아보자)
    * a++과 a+=1중에 누가 더 빠른지 알아보면 된다.

* 플래그 종류를 외워야한다. carry flag, zero flag, parity flag, overflow falg, sign flag, auxiliart carry flag
* 최상위 비트, 최하위 비트
* carry flag는 최상위 비트가 carry 되었을때 1로 바뀐다.
* 작은수에서 큰수 빼면 carry가 발생한다.
* 
***auxiliary carry(AC) flag***
* auxiliary carry(AC) flag는 3bit자리에서 carry가 발생했을때 1이 된다.

* neg 명령어는2의 보수 치환 하는 명령어이다.
***Operator and Drective***
* directive: 번역기가 번역할때 이렇게 번역해줘 라고 하는 지료

***OFFSET Operator*** =
* ? => 변수가 초기화가 안된 상태를 말한다.
* DUP: duplicate => 중복

***ALIGN Directive***
* cpu가 주소를 가져올때 홀수번호보다 짝수번호를 가져오는게 더 빠르기 때문에 사용한다.
* ALIGN 2하면 그 다음은 2의배수로 만든다.

***PTR Operator***
* 형변환을생각을 하자
* Memory latout of myDouble 그림을 확실히 이해할 수 있도록 하자

* TYPEDEF 사용가능
    * PBYTE TYPEDEF PTR BYTE => PTR BYTE를 PBYTE라는 이름으로 사용하겠다.
 
***ECX(counter)***
* CX가 묵시적으로 사용하는 명령어가 LOOP이다.
* 중첩 루프도 가능하다.



 
