#include <stdio.h>
#include<math.h>
#include<stdlib.h>
#include <time.h>
#define MAX_NUMERO 999
// aqui declaro las funciones 
double calculolimiteCB(int);
extern double calculolimiteASMB(int); 

int main(int argc, char **argv){
    struct timespec time1, time2; 
    double calculoC,calculoASM;
    int n;
    // scanf("%d",&cantidad);
    n=atoi(argv[1]);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 

    calculoC=calculolimiteCB(n);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);  
    double tC= (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9); 
    printf("El tiempo de demora en C es %lf \n ",tC);
    printf("el limite es %lf \n",calculoC);
    
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);
    calculoASM=calculolimiteASMB(n);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2); 
    double tASM = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9);
  
    printf("El tiempo de demora en ASM es %lf \n",tASM);
    printf("el limite en ASM es %lf \n",calculoASM);
    return 0;
}

double calculolimiteCB(int n){
    double limite=1 ,x=(double)(1+n)/n;
    int aux=n;
    while(aux>0){
        if(!(aux%2==0))
            limite*=x;
        x*=x;
        aux= aux/2;
    }
    return limite;
}