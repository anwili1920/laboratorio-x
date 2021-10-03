#include <stdio.h>
#include<math.h>
#include<stdlib.h>

//aqui declaro las funciones

double calculolimiteCB(int);
extern double calculolimiteASMB(int); 


int main(int argc, char **argv){
    double calculoC,calculoASM,d=0.5;
    int i, n, cantpar, r2,a=4;
    n = (int)atoi(argv[1]);
    calculoC=calculolimiteCB(n);
    printf("El limite en C  es %lf \n",calculoC); 
    calculoASM=calculolimiteASMB(n);
    printf("El limite en ASM es %lf \n",calculoASM);
    return 0;
}
double calculolimiteCB(int n){
    double resultado,base; 
    base=1+ (1/(double)n);
    resultado=pow(base,n);
    return resultado;
}
