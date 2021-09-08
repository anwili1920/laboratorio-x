#include <stdio.h>
#include <stdlib.h>

extern int voltear(int *a,  int N); 

int main (){
    int j,N;
    int arr[]={'a','n','g','i','e'};
    N = 5;
    for (j = 0; j < N; j++) printf("%c\t",arr[j]);
    printf("\n");
    voltear(arr, N); 
    for (j = 0; j < N; j++) printf("%c\t",arr[j]);
    printf("\n");
    //free(arr);

    return 0;
}
