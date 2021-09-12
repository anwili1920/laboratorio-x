#include <stdio.h>
#include<math.h>
#include<stdlib.h>
#include <time.h>
#define MAX_NUMERO 999
// aqui declaro las funciones 
void genRandomValues(double *, int );
double media(double*,int);
double calcularVarianzaC(double *,int);
extern double calcularVarianzaASM(double*,int); 

int main(){
    struct timespec time1, time2; 
    double arr[MAX_NUMERO]={0};
    double varianza,varianzaASM;
    int cantidad;
    printf("ingrese la cantidad de números");
    // scanf("%d",&cantidad);
    cantidad=6;
    genRandomValues(arr,cantidad);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 
    varianza=calcularVarianzaC(arr,cantidad);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);  
    double tC= (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9); 
    printf("El tiempo de demora en C es %lf \n ",tC);
    printf("la varianza es %lf \n",varianza);
    
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);
    varianzaASM=calcularVarianzaASM(arr,cantidad);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2); 
    double tASM = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9);
  
    printf("El tiempo de demora en ASM es %lf \n",tASM);
    printf("la varianza en ASM es %lf \n",varianzaASM);
    return 0;
}
void genRandomValues(double *v, int tam){
    double e = 0.0;
    int i = 0;
    for(i = 0; i < tam; i++){
        e = (double)(rand() % tam);
        v[i] = (sinf(e) + cosf(e))*0.707106;
        printf("%lf",e );
    }
    printf("\n");
}
double media(double *v, int tam){
    double m,suma=0;
    for(int i=0;i<tam;i++)
        suma+=v[i];
    
    m=suma/tam;
return m;
}
double calcularVarianzaC(double *v,int cant){
    double varianza,med=media(v,cant);
    for(int i=0;i<cant;i++)
        varianza= pow(v[i]-med,2);
    return (varianza/cant);
}