***Part4***
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
MOVZX reg32, reg/mem8   =>  32비트 레지스터에 8bit를 넣을 수 있다.
MOVZX reg32, reg/mem16  =>  32비트 레지스터에 16bit를 넣을 수 있다.   
MOVZX reg16, reg/mem8   =>  16비트 레지스터에 8bit를 넣을 수 있다.
~~~



 
