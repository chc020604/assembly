//공통
#include <stdio.h>
#include <string.h>
#include <stdlib.h> 
#include <ctype.h>  

1. 이진수 문자열 -> 정수
long binary_to_int(const char* bin_str) {
    long number = 0;
    for (int i = 0; bin_str[i] != '\0'; i++) {
        number = number << 1; // number *= 2;
        if (bin_str[i] == '1') {
            number++;
        }
    }
    return number;
}

2. 16진수 문자열 -> 정수
int hex_char_to_val(char c) {
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else {
        return toupper(c) - 'A' + 10;
    }
}

long long hex_to_int(const char* hex_str) {
    long long number = 0;
    for (int i = 0; hex_str[i] != '\0'; i++) {
        number = number << 4; // number *= 16;
        number += hex_char_to_val(hex_str[i]);
    }
    return number;
}
// 문자열 뒤집기 헬퍼 함수
void strrev(char *str) {
    int i = 0;
    int j = strlen(str) - 1;
    char temp;
    while (i < j) {
        temp = str[i];
        str[i] = str[j];
        str[j] = temp;
        i++;
        j--;
    }
}

3. 정수 -> 이진수 문자열
char* int_to_binary(int num) {
    if (num == 0) {
        char* result = (char*)malloc(2);
        strcpy(result, "0");
        return result;
    }

    char buffer[65]; // 64비트 정수 + 널 문자
    int i = 0;
    unsigned int n = num; // 음수 입력을 고려하여 unsigned로 처리

    while (n > 0) {
        buffer[i++] = (n % 2) + '0';
        n /= 2;
    }
    buffer[i] = '\0';
    strrev(buffer);

    char* result = (char*)malloc(strlen(buffer) + 1);
    strcpy(result, buffer);
    return result;
}

4. 정수 -> 16진수 문자열

   char val_to_hex_char(int n   ) {
    if (n >= 0 && n <= 9) {
        return n + '0';
    } else {
        return n - 10 + 'A';
    }
}

char* int_to_hex(int num) {
    if (num == 0) {
        char* result = (char*)malloc(2);
        strcpy(result, "0");
        return result;
    }
    char buffer[17]; 
    int i = 0;
    unsigned int n = num;

    while (n > 0) {
        buffer[i++] = val_to_hex_char(n % 16);
        n /= 16;
    }
    buffer[i] = '\0';
    strrev(buffer);

    char* result = (char*)malloc(strlen(buffer) + 1);
    strcpy(result, buffer);
    return result;
}
5. b진법(2-10) 문자열 덧셈
char* add_base_b(const char* str1, const char* str2, int b) {
    int len1 = strlen(str1);
    int len2 = strlen(str2);
    int max_len = len1 > len2 ? len1 : len2;
    char* result = (char*)malloc(max_len + 2); // 올림 + 널 문자
    int i = len1 - 1, j = len2 - 1, k = 0;
    int carry = 0;

    while (i >= 0 || j >= 0 || carry > 0) {
        int val1 = i >= 0 ? str1[i--] - '0' : 0;
        int val2 = j >= 0 ? str2[j--] - '0' : 0;
        int sum = val1 + val2 + carry;
        result[k++] = (sum % b) + '0';
        carry = sum / b;
    }
    result[k] = '\0';
    strrev(result);
    return result;
}
6. 16진수 문자열 덧셈
char* add_hex(const char* hex1, const char* hex2) {
    int len1 = strlen(hex1);
    int len2 = strlen(hex2);
    int max_len = len1 > len2 ? len1 : len2;
    char* result = (char*)malloc(max_len + 2);
    int i = len1 - 1, j = len2 - 1, k = 0;
    int carry = 0;

    while (i >= 0 || j >= 0 || carry > 0) {
        int val1 = i >= 0 ? hex_char_to_val(hex1[i--]) : 0;
        int val2 = j >= 0 ? hex_char_to_val(hex2[j--]) : 0;
        int sum = val1 + val2 + carry;
        result[k++] = val_to_hex_char(sum % 16);
        carry = sum / 16;
    }
    result[k] = '\0';
    strrev(result);
    return result;
}
7. 16진수 문자열 * 16진수 한 자리 곱셈
char* multiply_hex_by_digit(const char* hex_str, char hex_digit) {
    int multiplier = hex_char_to_val(hex_digit);
    if (multiplier == 0) {
        char* result = (char*)malloc(2);
        strcpy(result, "0");
        return result;
    }

    int len = strlen(hex_str);
    char* result = (char*)malloc(len + 2); // 올림 + 널 문자
    int i = len - 1, k = 0;
    int carry = 0;

    while (i >= 0 || carry > 0) {
        int val = i >= 0 ? hex_char_to_val(hex_str[i--]) : 0;
        int product = val * multiplier + carry;
        result[k++] = val_to_hex_char(product % 16);
        carry = product / 16;
    }
    result[k] = '\0';
    strrev(result);
    return result;
}
8.
public class Test {
    public static void main(String[] args) {
        int Y = 10; 
        int X = (Y + 4) * 3;
    }
}
9. 부호 없는 이진 정수 뺄셈
char* subtract_binary(const char* bin1, const char* bin2) {
    int len1 = strlen(bin1);
    int len2 = strlen(bin2);
    // bin1이 항상 크다고 가정
    char* result = (char*)malloc(len1 + 1);
    int i = len1 - 1, j = len2 - 1, k = 0;
    int borrow = 0;

    while (i >= 0) {
        int val1 = bin1[i--] - '0';
        int val2 = j >= 0 ? bin2[j--] - '0' : 0;
        int diff = val1 - val2 - borrow;

        if (diff < 0) {
            diff += 2;
            borrow = 1;
        } else {
            borrow = 0;
        }
        result[k++] = diff + '0';
    }
    result[k] = '\0';
    strrev(result);

    // 결과 앞의 불필요한 '0' 제거
    int first_one = -1;
    for(int l=0; l<strlen(result); ++l) {
        if(result[l] == '1') {
            first_one = l;
            break;
        }
    }
    if(first_one == -1) { // 결과가 0일 경우
        strcpy(result, "0");
    } else if (first_one > 0) {
        memmove(result, result + first_one, strlen(result) - first_one + 1);
    }

    return result;
}

**main함수**
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

// 위에 정의된 모든 함수들을 여기에 붙여넣으세요.
// ... (binary_to_int, hex_to_int, int_to_binary, 등등) ...

// main 함수
int main() {
    // 1. 이진수 -> 정수
    printf("1. '10110101' -> %ld\n", binary_to_int("10110101"));

    // 2. 16진수 -> 정수
    printf("2. '1A3F' -> %lld\n", hex_to_int("1A3F"));

    // 3. 정수 -> 이진수
    char* bin_res = int_to_binary(181);
    printf("3. 181 -> '%s'\n", bin_res);
    free(bin_res);

    // 4. 정수 -> 16진수
    char* hex_res = int_to_hex(6719);
    printf("4. 6719 -> '%s'\n", hex_res);
    free(hex_res);

    // 5. b진법 덧셈
    char* base_b_sum = add_base_b("17", "25", 8);
    printf("5. 8진법 '17' + '25' = '%s'\n", base_b_sum);
    free(base_b_sum);

    // 6. 16진수 덧셈
    char* hex_sum = add_hex("1A", "2B");
    printf("6. '1A' + '2B' = '%s'\n", hex_sum);
    free(hex_sum);

    // 7. 16진수 곱셈
    char* hex_prod = multiply_hex_by_digit("A1F", 'C');
    printf("7. 'A1F' * 'C' = '%s'\n", hex_prod);
    free(hex_prod);
    
    // 9. 이진수 뺄셈
    printf("9. 이진수 뺄셈 테스트:\n");
    char* sub_res1 = subtract_binary("10001000", "00000101");
    printf("   '10001000' - '00000101' = '%s'\n", sub_res1);
    free(sub_res1);

    char* sub_res2 = subtract_binary("1101", "110");
    printf("   '1101' - '110' = '%s'\n", sub_res2);
    free(sub_res2);

    char* sub_res3 = subtract_binary("10000", "1");
    printf("   '10000' - '1' = '%s'\n", sub_res3);
    free(sub_res3);

    return 0;
}
