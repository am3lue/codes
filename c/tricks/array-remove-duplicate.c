#include <stdio.h>

int main() {
    int arr[100], n, i, j, k;

    printf("Enter number of elements: ");
    scanf("%d", &n);

    printf("Enter %d elements:\n", n);
    for (i = 0; i < n; i++)
        scanf("%d", &arr[i]);

    // Removing duplicates
    for (i = 0; i < n; i++) {
        for (j = i + 1; j < n; j++) {
            if (arr[i] == arr[j]) {
                // Shift elements left
                for (k = j; k < n - 1; k++)
                    arr[k] = arr[k + 1];

                n--;        // Reduce array size
                j--;        // Re-check the same index
            }
        }
    }

    printf("Array after removing duplicates:\n");
    for (i = 0; i < n; i++)
        printf("%d ", arr[i]);

    return 0;
}
