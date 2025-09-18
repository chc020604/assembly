* ollydbg 다운로드
* 인프런에서 어셈블리어 배우기 강의 듣기
* 네프킨(Napkin)

* FETCH : 주기억장치에 있는 명령을 cpu로 가져오는 일
* main = entry point(진입점)
* MOVE AX, 1234j = B8 34 12
  * 34를 먼저 가져오고 12를 가져옴.
  * MOVE의 opcode는 B8(16진수/1바이트)임
* a + b => a,b: operand / +: operator
* 명령: opcode
* 다음에 실행할 명령의 주소가 들어가있는 곳
    * instruction pointer
    * progtam counter
    * location counter
* cache memory(캐시 메모리): cpu보단 느리지만 주기억장치보단 빠른 메모리
    * cpu와 주기억장치 사이에 위치하고 cpu가 명령어를 찾을 때 캐시메모리부터 찾고 없으면 주기억장치에서 찾는다.
    * s|e|m  => 싸인비트|지수부|가수부 : 지수부를 cache메모리가 거의 담당한다.
* 모든 동작은 레지스터에서 이루어진다
* cpu안에 있는 레지스터가 있음 모두 주소가 정해져있다
* memory read sequence: 레지스터에 주소 -> 읽기 신호 주기 ->  ~~
* Program Execution Process:
   1. .exe(실행파일) 찾기
   2. 없으면 환경변수에서 경로를 찾는다
   3. 파일 찾았으면 메모리에 적제
   4. 실행 (실행단계는 cpu 플로우를 따른다)
   5. Track Process
   6. 실행 완료 됐으면 메모리에서 사라진다

* 각각의 프로세스는 보호(protect)되고 있다. => 각각의 프로세스는 서로 영향을 주지 않는다.
* real-address mode는 모든 메모리에 접근할 수 있다.
* system management mode는 제조사가 사용하는 모드
* 우리가 사용하는 모드는 protected mode(4GBytes)이다.
* 레지스터 명칭 AX,BX,CX,DX
* 레지스터 명칭: AX는 16bit이지만 8bit두개로 나누면 AH, AL로 나눌 수 있고 AX가 32bit면 EAX, 64bit면 RAX라고 부른다
* context switch: 현재 사용하는 정보로 바꾼다.(알아보자)
* segment registers: GS, GS, CS, DS, ES, SS
* 마더보드 발표 ollydbg 다운로드
* 인프런에서 어셈블리어 배우기 강의 듣기
* 네프킨(Napkin)

* FETCH : 주기억장치에 있는 명령을 cpu로 가져오는 일
* main = entry point(진입점)
* MOVE AX, 1234j = B8 34 12
  * 34를 먼저 가져오고 12를 가져옴.
  * MOVE의 opcode는 B8(16진수/1바이트)임
* a + b => a,b: operand / +: operator
* 명령: opcode
* 다음에 실행할 명령의 주소가 들어가있는 곳
    * instruction pointer
    * progtam counter
    * location counter
* cache memory(캐시 메모리): cpu보단 느리지만 주기억장치보단 빠른 메모리
    * cpu와 주기억장치 사이에 위치하고 cpu가 명령어를 찾을 때 캐시메모리부터 찾고 없으면 주기억장치에서 찾는다.
    * s|e|m  => 싸인비트|지수부|가수부 : 지수부를 cache메모리가 거의 담당한다.
* 모든 동작은 레지스터에서 이루어진다
* cpu안에 있는 레지스터가 있음 모두 주소가 정해져있다
* memory read sequence: 레지스터에 주소 -> 읽기 신호 주기 ->  ~~
* Program Execution Process:
   1. .exe(실행파일) 찾기
   2. 없으면 환경변수에서 경로를 찾는다
   3. 파일 찾았으면 메모리에 적제
   4. 실행 (실행단계는 cpu 플로우를 따른다)
   5. Track Process
   6. 실행 완료 됐으면 메모리에서 사라진다

* 각각의 프로세스는 보호(protect)되고 있다. => 각각의 프로세스는 서로 영향을 주지 않는다.
* real-address mode는 모든 메모리에 접근할 수 있다.
* system management mode는 제조사가 사용하는 모드
* 우리가 사용하는 모드는 protected mode(4GBytes)이다.
* 레지스터 명칭 AX,BX,CX,DX
* 레지스터 명칭: AX는 16bit이지만 8bit두개로 나누면 AH, AL로 나눌 수 있고 AX가 32bit면 EAX, 64bit면 RAX라고 부른다
* context switch: 현재 사용하는 정보로 바꾼다.(알아보자)
* segment registers: GS, GS, CS, DS, ES, SS
* 마더보드 발표 - 여러가지 종류의 가격 필수, 종류 설명, 각각의 슬롯 설명( 어디에 뭐가 꽃히는지 )
