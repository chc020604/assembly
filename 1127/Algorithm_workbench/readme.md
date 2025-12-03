# 9.9.2 Algorithm Workbench  
(문제 + 답 + 코드 예시 / README.md용 Markdown)

---

## 1. Base-Index Operand Example (베이스-인덱스 피연산자 예제)  
**Q:** 32비트 모드에서 베이스-인덱스 피연산자의 예를 보여라.  
**답:** `[ebx + esi]`

### 예시 코드
~~~asm
mov eax, [ebx + esi]
~~~

---

## 2. Base-Index-Displacement Operand Example (베이스-인덱스-변위 피연산자 예제)  
**Q:** 32비트 모드에서 베이스-인덱스-변위 피연산자의 예를 보여라.  
**답:** `[ebx + esi + 10h]`

### 예시 코드
~~~asm
mov eax, [ebx + esi + 4]
~~~

---

## 3. Addressing 2D Array Element (2차원 배열 요소 주소 지정)  
**Q:** DWORD 2D 배열에서 두 번째 행, 세 번째 열의 주소를 ESI/EDI로 표현하라.  
**답:** `[ebx + esi*16 + edi*4]`

### 예시 코드
~~~asm
mov esi, 1
mov edi, 2
mov eax, [ebx + esi*16 + edi*4]
~~~

---

## 4. Comparing Arrays with CMPSW (CMPSW로 배열 비교)  
**답:**
~~~asm
mov esi, OFFSET sourcew
mov edi, OFFSET targetw
mov ecx, LENGTHOF sourcew
cld
repe cmpsw
~~~

---

## 5. Scanning with SCASW (SCASW로 값 검색)  
**답:**
~~~asm
mov edi, OFFSET wordArray
mov ax, 0100h
mov ecx, LENGTHOF wordArray
cld
repne scasw
jnz Quit
dec edi
dec edi
mov eax, edi
Quit:
~~~

---

## 6. String Comparison Procedure (문자열 비교)  
**답:**
~~~asm
INVOKE Str_compare, ADDR string1, ADDR string2
ja String1_Larger
mov edx, OFFSET string2
jmp Print
String1_Larger:
mov edx, OFFSET string1
Print:
call WriteString
~~~

---

## 7. Str_trim Usage  
**답:**
~~~asm
INVOKE Str_trim, ADDR myString, '@'
~~~

---

## 8. Modifying Str_ucase (소문자로 변경)  
**답:**
~~~asm
cmp al, 'A'
jb  NextChar
cmp al, 'Z'
ja  NextChar
add al, 32
mov [esi], al
~~~

---

## 9. 64-bit Str_trim  
**답:**
~~~asm
Str_trim64 PROC USES rax rcx rdi,
    pString:PTR BYTE,
    charToTrim:BYTE

    mov rdi, rcx
    invoke Str_length, rcx
    cmp rax, 0
    je  Exit_Proc

    add rdi, rax
    dec rdi

L1:
    mov al, [rdi]
    cmp al, dl
    jne Exit_Proc
    mov BYTE PTR [rdi], 0
    dec rdi
    cmp rdi, rcx
    jae L1

Exit_Proc:
    ret
Str_trim64 ENDP
~~~

---

## 10. 64-bit Base-Index Operand  
**답:** `[rbx + rsi]`

~~~asm
mov rax, [rbx + rsi]
~~~

---

## 11. 32-bit Array Access  
**답:**
~~~asm
mov eax, myArray[ebx + edi*4]
~~~

---

## 12. 64-bit Array Access  
**답:**
~~~asm
mov rax, myArray[rbx + rdi*8]
~~~
