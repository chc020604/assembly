**12/11 어셈블리 최종 발표 과제**
1. Asm + C (add two 같은 간단한 함수를 만들어도 된다.)
2. Library
3. DLL
   1. 어셈블리와 c언어 조합되는 프로시저 만들기.
   2. 어셈블리와 c언어가 조합되어있는 라이브러리 만들기
   3. DLL만들기

* chapter에 첫번째 문제는 암기하고 공부하는게 좋다.

# 9장 String and Array

## String Primitive Instructions

* 프로시저의 리턴값은 EAX에 담는다
* 루프에 카운터는 CX에 담는다
* 문자열에 관련된것은 SI, DI에 담는다.

* compare과 accumulator가 동시에 이루어 지는것이 Scan이다

**Using a Repeat Prefix, Example: Copy a String**
* cld (cl) : clear Direction flag
* STD : set Direction flag
* 단위는 byte 이다
* cx가 0보다 크면 계속 반복

### MOVSB, MOVSW, and MOVSD

### CMPSB, CMPSW, and CMPSD

### SCASB, SCASW, and SCASD
* Ax레지스터와 DI레지스터의 내용을 비교한다.

### STOSB, STOSW, and STOSD

### LODSB, LODSW, and LODSD
* SI에 있는 내용을 Load해온다.

### Str_compare Procedure

## Selected String Procedures

### Str_length Procedure

### Str_copy Procedure

### Str_trim Procedure

### Detailed Description

### Str_ucase Procedure

### String Library Demo Program

## Two-Dimensional Arrays

### Ordering of Rows and Columns
* Ordering에는 Row-major와 Column-major가 있다 (행 방향으로 읽기, 열방향으로 읽기)
* 대부분 Row-major를 사용한다.
  
### Base-Index Operands
* 베이스 레지스터와 인덱스 레지스터를 사용해서 ~ 접근한다. 

* $은 현재주소를 나타낸다
  * Rowsize = ($ - tableB)

* row_index랑 column_index로 조정해서 어디든 지정해서 갈수있다.
  * RowSize * row_index를 하면 어디든 갈수있다(?) 
### Calculating a Row Sum

### Scale Factors

### Base-Index-Displacement Operands

## Searching and Sorting Intergers Arrays

### Bubble Sort

### Binary Search

### Test Program