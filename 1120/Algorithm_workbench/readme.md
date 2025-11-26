8.10.2 Algorithm Workbench (알고리즘 워크벤치 풀이)

1. Stack Frame Visualization (스택 프레임 시각화)

Q: Here is a calling sequence for a procedure named AddThree that adds three doublewords (assume that the STDCALL calling convention is used). Draw a picture of the procedure’s stack frame immediately after EBP has been pushed on the runtime stack.
(Q: 세 개의 더블워드를 더하는 AddThree라는 프로시저의 호출 순서가 다음과 같습니다 (STDCALL 호출 규약을 사용한다고 가정). EBP가 런타임 스택에 푸시된 직후 프로시저의 스택 프레임 그림을 그리십시오.)

push 10h
push 20h
push 30h
call AddThree


답 (Answer):

-----------------  <-- High Memory Address
|      10h      |  [EBP + 16] (Third Parameter)
-----------------
|      20h      |  [EBP + 12] (Second Parameter)
-----------------
|      30h      |  [EBP + 8]  (First Parameter)
-----------------
| Return Address|  [EBP + 4]
-----------------
|   Saved EBP   |  <-- EBP points here (ESP points here immediately after 'push ebp')
-----------------  <-- Low Memory Address


풀이: STDCALL 규약에서는 매개변수를 역순(오른쪽에서 왼쪽)으로 푸시하는 것이 일반적이지만, 문제에 주어진 코드가 push 10h, 20h, 30h 순서이므로 스택에는 10h가 가장 먼저(높은 주소) 들어가고, 30h가 가장 나중에(낮은 주소) 쌓입니다. call 명령어는 복귀 주소를 푸시하고, 프로시저 진입 후 push ebp가 실행되면 현재 EBP가 저장됩니다.
