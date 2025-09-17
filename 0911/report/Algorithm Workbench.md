#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// 1. Convert 16-bit binary string to integer

int binaryToInt(char* binaryStr) {
    int result = 0;
    int len = strlen(binaryStr);
    
    for (int i = 0; i < len; i++) {
        if (binaryStr[i] == '1') {
            result = result * 2 + 1;
        } else if (binaryStr[i] == '0') {
            result = result * 2;
        }
    }
    return result;
}

// 2. Convert 32-bit hexadecimal string to integer
long hexToInt(char* hexStr) {
    long result = 0;
    int len = strlen(hexStr);
    
    for (int i = 0; i < len; i++) {
        char c = hexStr[i];
        int digit;
        
        if (c >= '0' && c <= '9') {
            digit = c - '0';
        } else if (c >= 'A' && c <= 'F') {
            digit = c - 'A' + 10;
        } else if (c >= 'a' && c <= 'f') {
            digit = c - 'a' + 10;
        } else {
            continue; // Skip invalid characters
        }
        
        result = result * 16 + digit;
    }
    return result;
}

// 3. Convert integer to binary string
char* intToBinary(int num) {
    if (num == 0) {
        char* result = malloc(2);
        strcpy(result, "0");
        return result;
    }
    
    char temp[33]; // 32 bits + null terminator
    int index = 0;
    int n = num;
    
    while (n > 0) {
        temp[index++] = (n % 2) + '0';
        n /= 2;
    }
    
    // Reverse the string
    char* result = malloc(index + 1);
    for (int i = 0; i < index; i++) {
        result[i] = temp[index - 1 - i];
    }
    result[index] = '\0';
    
    return result;
}

// 4. Convert integer to hexadecimal string
char* intToHex(int num) {
    if (num == 0) {
        char* result = malloc(2);
        strcpy(result, "0");
        return result;
    }
    
    char temp[9]; // 8 hex digits + null terminator
    int index = 0;
    int n = num;
    char hexDigits[] = "0123456789ABCDEF";
    
    while (n > 0) {
        temp[index++] = hexDigits[n % 16];
        n /= 16;
    }
    
    // Reverse the string
    char* result = malloc(index + 1);
    for (int i = 0; i < index; i++) {
        result[i] = temp[index - 1 - i];
    }
    result[index] = '\0';
    
    return result;
}

// 5. Add two digit strings in base b (2 <= b <= 10)
char* addInBase(char* num1, char* num2, int base) {
    int len1 = strlen(num1);
    int len2 = strlen(num2);
    int maxLen = (len1 > len2) ? len1 : len2;
    
    char* result = malloc(maxLen + 2); // +1 for carry, +1 for null
    int carry = 0;
    int resultIndex = 0;
    
    int i = len1 - 1;
    int j = len2 - 1;
    
    while (i >= 0 || j >= 0 || carry > 0) {
        int digit1 = (i >= 0) ? (num1[i] - '0') : 0;
        int digit2 = (j >= 0) ? (num2[j] - '0') : 0;
        
        int sum = digit1 + digit2 + carry;
        result[resultIndex++] = (sum % base) + '0';
        carry = sum / base;
        
        i--;
        j--;
    }
    
    // Reverse the result
    char* finalResult = malloc(resultIndex + 1);
    for (int k = 0; k < resultIndex; k++) {
        finalResult[k] = result[resultIndex - 1 - k];
    }
    finalResult[resultIndex] = '\0';
    
    free(result);
    return finalResult;
}

// 6. Add two hexadecimal strings
char* addHexStrings(char* hex1, char* hex2) {
    int len1 = strlen(hex1);
    int len2 = strlen(hex2);
    int maxLen = (len1 > len2) ? len1 : len2;
    
    char* result = malloc(maxLen + 2);
    char hexDigits[] = "0123456789ABCDEF";
    int carry = 0;
    int resultIndex = 0;
    
    int i = len1 - 1;
    int j = len2 - 1;
    
    while (i >= 0 || j >= 0 || carry > 0) {
        int digit1 = 0, digit2 = 0;
        
        if (i >= 0) {
            char c = hex1[i];
            if (c >= '0' && c <= '9') digit1 = c - '0';
            else if (c >= 'A' && c <= 'F') digit1 = c - 'A' + 10;
            else if (c >= 'a' && c <= 'f') digit1 = c - 'a' + 10;
        }
        
        if (j >= 0) {
            char c = hex2[j];
            if (c >= '0' && c <= '9') digit2 = c - '0';
            else if (c >= 'A' && c <= 'F') digit2 = c - 'A' + 10;
            else if (c >= 'a' && c <= 'f') digit2 = c - 'a' + 10;
        }
        
        int sum = digit1 + digit2 + carry;
        result[resultIndex++] = hexDigits[sum % 16];
        carry = sum / 16;
        
        i--;
        j--;
    }
    
    // Reverse the result
    char* finalResult = malloc(resultIndex + 1);
    for (int k = 0; k < resultIndex; k++) {
        finalResult[k] = result[resultIndex - 1 - k];
    }
    finalResult[resultIndex] = '\0';
    
    free(result);
    return finalResult;
}

// 7. Multiply single hex digit by hex string
char* multiplyHexDigitByString(char hexDigit, char* hexString) {
    int len = strlen(hexString);
    char* result = malloc(len + 2); // +1 for potential carry, +1 for null
    char hexDigits[] = "0123456789ABCDEF";
    
    // Convert hex digit to integer
    int multiplier = 0;
    if (hexDigit >= '0' && hexDigit <= '9') multiplier = hexDigit - '0';
    else if (hexDigit >= 'A' && hexDigit <= 'F') multiplier = hexDigit - 'A' + 10;
    else if (hexDigit >= 'a' && hexDigit <= 'f') multiplier = hexDigit - 'a' + 10;
    
    if (multiplier == 0) {
        char* zeroResult = malloc(2);
        strcpy(zeroResult, "0");
        return zeroResult;
    }
    
    int carry = 0;
    int resultIndex = 0;
    
    for (int i = len - 1; i >= 0; i--) {
        int digit = 0;
        char c = hexString[i];
        if (c >= '0' && c <= '9') digit = c - '0';
        else if (c >= 'A' && c <= 'F') digit = c - 'A' + 10;
        else if (c >= 'a' && c <= 'f') digit = c - 'a' + 10;
        
        int product = digit * multiplier + carry;
        result[resultIndex++] = hexDigits[product % 16];
        carry = product / 16;
    }
    
    if (carry > 0) {
        result[resultIndex++] = hexDigits[carry];
    }
    
    // Reverse the result
    char* finalResult = malloc(resultIndex + 1);
    for (int k = 0; k < resultIndex; k++) {
        finalResult[k] = result[resultIndex - 1 - k];
    }
    finalResult[resultIndex] = '\0';
    
    free(result);
    return finalResult;
}

// 9. Binary subtraction function
char* subtractBinary(char* minuend, char* subtrahend) {
    int len1 = strlen(minuend);
    int len2 = strlen(subtrahend);
    int maxLen = (len1 > len2) ? len1 : len2;
    
    char* result = malloc(maxLen + 1);
    int borrow = 0;
    int resultIndex = 0;
    
    int i = len1 - 1;
    int j = len2 - 1;
    
    while (i >= 0) {
        int bit1 = minuend[i] - '0';
        int bit2 = (j >= 0) ? (subtrahend[j] - '0') : 0;
        
        int diff = bit1 - bit2 - borrow;
        
        if (diff < 0) {
            diff += 2;
            borrow = 1;
        } else {
            borrow = 0;
        }
        
        result[resultIndex++] = diff + '0';
        i--;
        j--;
    }
    
    // Remove leading zeros and reverse
    while (resultIndex > 1 && result[resultIndex - 1] == '0') {
        resultIndex--;
    }
    
    char* finalResult = malloc(resultIndex + 1);
    for (int k = 0; k < resultIndex; k++) {
        finalResult[k] = result[resultIndex - 1 - k];
    }
    finalResult[resultIndex] = '\0';
    
    free(result);
    return finalResult;
}

// Test functions
void testAllFunctions() {
    printf("=== Algorithm Workbench Tests ===\n\n");
    
    // Test 1: Binary to Integer
    printf("1. Binary to Integer:\n");
    printf("   Binary '1010' = %d\n", binaryToInt("1010"));
    printf("   Binary '1111111111111111' = %d\n\n", binaryToInt("1111111111111111"));
    
    // Test 2: Hex to Integer
    printf("2. Hex to Integer:\n");
    printf("   Hex 'FF' = %ld\n", hexToInt("FF"));
    printf("   Hex 'FFFFFFFF' = %ld\n\n", hexToInt("FFFFFFFF"));
    
    // Test 3: Integer to Binary
    printf("3. Integer to Binary:\n");
    char* bin1 = intToBinary(10);
    char* bin2 = intToBinary(255);
    printf("   Integer 10 = %s\n", bin1);
    printf("   Integer 255 = %s\n\n", bin2);
    free(bin1); free(bin2);
    
    // Test 4: Integer to Hex
    printf("4. Integer to Hex:\n");
    char* hex1 = intToHex(255);
    char* hex2 = intToHex(4095);
    printf("   Integer 255 = %s\n", hex1);
    printf("   Integer 4095 = %s\n\n", hex1);
    free(hex1); free(hex2);
    
    // Test 5: Add in base
    printf("5. Add in Base:\n");
    char* sum1 = addInBase("123", "456", 10);
    char* sum2 = addInBase("101", "110", 2);
    printf("   Base 10: 123 + 456 = %s\n", sum1);
    printf("   Base 2: 101 + 110 = %s\n\n", sum2);
    free(sum1); free(sum2);
    
    // Test 6: Add hex strings
    printf("6. Add Hex Strings:\n");
    char* hexSum = addHexStrings("FF", "1");
    printf("   Hex: FF + 1 = %s\n\n", hexSum);
    free(hexSum);
    
    // Test 7: Multiply hex digit by string
    printf("7. Multiply Hex Digit by String:\n");
    char* product = multiplyHexDigitByString('2', "FF");
    printf("   Hex: 2 * FF = %s\n\n", product);
    free(product);
    
    // Test 9: Binary subtraction
    printf("9. Binary Subtraction:\n");
    char* diff1 = subtractBinary("10001000", "00000101");
    char* diff2 = subtractBinary("11111111", "00001111");
    char* diff3 = subtractBinary("10101010", "01010101");
    printf("   10001000 - 00000101 = %s\n", diff1);
    printf("   11111111 - 00001111 = %s\n", diff2);
    printf("   10101010 - 01010101 = %s\n\n", diff3);
    free(diff1); free(diff2); free(diff3);
}

int main() {
    testAllFunctions();
    return 0;
}
8.

public class BytecodeExample {
    public static void main(String[] args) {
        int Y = 5;  // Initialize Y for demonstration
        int X = (Y + 4) * 3;
        System.out.println("X = " + X);
    }
}
