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
