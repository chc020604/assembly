* ollydbg 다운로드
* 인프런에서 어셈블리어 배우기 강의 듣기

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
