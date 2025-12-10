#include <stdio.h>
#include "BubbleSort.h"
extern void bubbleSort(int* arr, int n);

int main() {
    int arr[] = { 64, 34, 25, 12, 22, 11, 90 };
    int n = sizeof(arr) / sizeof(arr[0]);
    int i;

    printf("정렬 전: ");
    for (i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");

    bubbleSort(arr, n);

    printf("정렬 후: ");
    for (i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");

    return 0;
}