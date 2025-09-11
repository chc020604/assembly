- 언어는 machine language, assembly language, High level language 3가지로 나뉜다.
- 크게 natural language, Artificial Language로 나뉜다
- interpreter (통역), compliler (번역)
- 기계어와 기호가 1대1 대응이 되는 언어가 assembly 언어다.
- op code(명령어/8bit-2^8정도의 명령어를 가지고 있다), operand(명령을 실행하는 곳)
- assembly language를 machine language로 변역해주는 장치: assembler, 번역하는과정: assemble
- 기계마다 기계어가 다르다 => 즉, 기계마다 assembly 언어가 다르다 ( assembly 언어는 기계어와 1대1 대응되기 때문에 )
- 정해진 비트중에 가장 왼쪽에 있는 비트인 최상위 비트를 MSB / 정해진 비트중에 가장 오른쪽에있는 비트인 최하위 비트 LSB 
- 인의예지신 중도에대해 서술하는게 마지막 시험문
- 보수: 기준 수에서 모자란수
    - radix -> r진법
      1. r의 보수 : r^n-N
      2. 2. (r-1)의 보수 : r^n - r^-m - N
          - n: 자리수, m: 소수점 이하 자리수, N: 수
          - 428 ->    1. 10^3 - 428 = 572    /    2. 10^3 - 10^-0 - 428 = 571

-
