### Interger Arithmetic

## shigt and Rotate Instructions

# shift
* SHL: Shift Left   <<
* SHR: Shift right  >> : shift후 최상위 비트를 무조건 0으로 채운다.
* SAL: Shift arithmetic left (SHL과 같아서 <<<라는게 따로 있지는 않다)
* SAR: Shift arithmetic right   >>> : shift후 최상위 비트에 맞게 채운다.

~~~
move dl, 5  00000101    = 5
shl dl, 1   00001010    = 10 (5 * 2^1)

shift 횟수에 따라 ( 비트 수 * 2^shift 횟수 )이다.

move dl, 5  00000101    = 5
shl dl, 2   00010100    = 20 (5 * 2^2)
~~~
* carry가 발생했을때는 위 처럼 곱하기 2의 shift승을 적용할 수 없다.

# Rotate
* Rotate가 되었을때도 carry flag가 발생을 한다.
