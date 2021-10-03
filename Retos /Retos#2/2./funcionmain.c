#include <stdio.h>
#include<math.h>
#include<stdlib.h>

//aqui declaro las funciones

double CLimite(int);
extern double ASMLimite(int); 


int main(int argc, char **argv){
    double calculoC,calculoASM,d=0.5;
    int i, n, cantpar, r2,a=4;
    n = (int)atoi(argv[1]);
    calculoC=CLimite(n);
    printf("El limite en C  es %lf \n",calculoC); 
    calculoASM=ASMLimite(n);
    printf("El limite en ASM es %lf \n",calculoASM);
    return 0;
}
double CLimite(int n){
    double resultado,base; 
    base=1+ (1/(double)n);
    resultado=pow(base,n);
    return resultado;
}
