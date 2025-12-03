# Chapter 9 Review Questions & Answers  
9장 복습 문제 및 정답

---

## 1. Which Direction flag setting causes index registers to move backward through memory?  
**답:** DF = 1 (STD)  
→ 방향 플래그가 1일 때 역방향 이동.

---

## 2. When a repeat prefix is used with STOSW, what value is added/subtracted from the index register?  
**답:** 2  
→ 워드(word)는 2바이트.

---

## 3. In what way is the CMPS instruction ambiguous?  
**답:** Subtraction direction is unclear.  
→ 실제 연산: `[ESI] - [EDI]` (Source - Destination)

---

## 4. When DF=0 and SCASB finds a matching character, where does EDI point?  
**답:** 일치 문자 바로 다음 주소.

---

## 5. Which repeat prefix is best when scanning for the first occurrence of a character?  
**답:** REPNE 또는 REPNZ

---

## 6. What DF setting is used in Str_trim (Section 9.3)?  
**답:** DF = 1 (역방향 스캔)

---

## 7. Why does Str_trim use JNE?  
**답:** 구분자가 아닌 문자를 발견하면 스캔을 멈추기 위해.

---

## 8. What happens in Str_ucase if the string contains a digit?  
**답:** 숫자는 그대로 유지됨.

---

## 9. If Str_length used SCASB, which repeat prefix would be most appropriate?  
**답:** REPNE

---

## 10. If Str_length used SCASB, how would it calculate the length?  
**답:**  
최종 EDI − 초기 EDI − 1 (널 종료문자 제외)

---

## 11. Maximum comparisons for binary search on 1024 elements?  
**답:** 11 (log₂(1024)
