#include <stdio.h>
#include <stdlib.h>
extern void selector(int *a,  int N); 

int main(int argc, char **argv){
    int i, N, cantpar, r2;
    int *arr;
    N = argc - 1; 
    arr = (int*) malloc(N*sizeof(int));
    //printf("%d\n", sizeof(arr));
    
    if (argc < 2){
        N = 3;
        for (i = 0; i < N; i++) arr[i] = i;
    } else{
        for (i = 1; i < argc; i++) arr[i-1] = (int)atoi(argv[i]);
    }
// eliminar los valores pares de un arreglo
    selector(arr, N);
    for (i = 0; i < N; i++) printf("%d\t",arr[i]);
    printf("\n cantidad  %d \n", cantpar);

    free(arr);
    return 0;
}
