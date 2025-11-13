# Interger Arithmetic

## shigt and Rotate Instructions

### shift
* SHL: Shift Left   
* > <<
* SHR: Shift right  
* > \>> : shift후 최상위 비트를 무조건 0으로 채운다.
* SAL: Shift arithmetic left 
* > SHL과 같아서 <<<라는게 따로 있지는 않다
* SAR: Shift arithmetic right   
* > \>>> : shift후 최상위 비트에 맞게 채운다.

~~~
move dl, 5  00000101    = 5
shl dl, 1   00001010    = 10 (5 * 2^1)

shift 횟수에 따라 ( 비트 수 * 2^shift 횟수 )이다.

move dl, 5  00000101    = 5
shl dl, 2   00010100    = 20 (5 * 2^2)
~~~
* carry가 발생했을때는 위 처럼 곱하기 2의 shift승을 적용할 수 없다.

### Rotate
* Rotate가 되었을때도 carry flag가 발생을 한다.

## shigt and Rotate Applications

### SHLD/SHRD instructions
* dest(destination), sourse, count
* D가 붙으면 시프트를 했을 때 다른 곳에 있는 비트의 최상위 비트로 채워진다 

### Extracting File Data Fields
* 컴퓨터 내부에 시간이 이 방식으로 저장되어 있다.

* file 구성: 파일의 각종 정보, 파일의 내용으로 구성되어 있다.

## Multiplivation and Division Instructions

### MUL Instruction
* MUL 명령어는 Carry flag와 관련이 되어있다 ( 0아니면 1이니까 뭐 ㅇㅇ)
* MUL명령어는 AX, BX, CX, DX에 무조건 들어간다 
* 따로 공부해서 추가

### IMUL Instruction
* Single Operand Formats
> imul al, 48
* Two Operand Formats
> imul bx, ax
* Three Operand Formats

### DIV Instruction
* 나누기

### Signed Interger Division
* cwd : 부호확장 하는 명령어
~~~
.data
wordVal SWORD -101  ; 009Bh

.code
mov eax, 0          ; EAX = 00000000h
mov ax, wordVal     ; EAX = 0000009Bh   (+155)
cwd                 ; EAX = FFFFFF9Bh   (-101)  => 부호확장을 해준다.
mov bx, 2           ; EBX is the division
idiv bx             ; divide EAX by BX (signed operation)
~~~ 

### Divide Overflow
* 0으로 나누게 되는 경우는 절대 있어서는 안된다.

## Extended Addition and Subtraction

### ADC Instruction
~~~
ADD AL, 0FFh    11111111 + 11111111 => 11111110 (carry 발생)
ADC DL, 0       00000000 + 00000000 + 1(carry flag) => 00000001
~~~
> ADD인지 ADC인지 확실하게 확인 해야한다.

## ASCII and Unpacked Decimal Arithmetic
* AAA : add나 adc 명령 다음에 사용을 하고 ASCII foramt을 unpacked형식으로 바꿔준다.
* AAS
* AAM
* AAD

## Packed Decimal Arithmetic
