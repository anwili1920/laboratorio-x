#include <stdio.h>
#include<math.h>
#include<stdlib.h>
double CLimite(int n){
    double resultado,base; 
    base=1+ (1/(double)n);
    resultado=pow(base,n);
    return resultado;
}
