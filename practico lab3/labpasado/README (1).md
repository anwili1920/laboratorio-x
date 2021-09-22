# Pregunta 2 (10 puntos):
El filtro promedio móvil es un algoritmo que permite "suavizar" una señal discreta eliminando variaciones bruscas que se puedan presentar. La implementación del algoritmo requiere de un arreglo de números reales que corresponden a la señal de entrada y de un arreglo de salida que se forma calculando la media aritmética de los valores en las posiciones `n`, `n-1`, y `n+1` de forma iterativa. La siguiente imagen muestra el desarrollo del algoritmo para un arreglo de entrada de 10 elementos. 

**IMPORTANTE: Para los extremos del arreglo, repetir el valor del centro (posición `n` - valores en color rojo)**
![alt text](./.imgRepo/pregunta1.jpeg)

Se le pide lo siguiente:

- Codificar la función en C `avgFilter` (dentro del archivo `main.c`) que implemente el algoritmo descrito en la imagen anterior. Para ello, considerar que el vector `x` es un arreglo de números reales aleatorios cuyo tamaño es ingresado por el usuario al ejecutar el programa. Por ejemplo, para `1024` elementos, el usuario debe ingresar lo siguiente:
```
$ ./main 1024
```
- Codificar la función `avgFilterASM` (dentro del archivo `avgFilterASM.asm`) en lenguaje ensamblador para Intel de 64 bits que desarrolle el algoritmo descrito en la imagen anterior. El prototipo de esta función debe ser igual al prototipo de la función desarrollada en C.

- El programa principal `main.c` debe imprimir los tiempos de ejecución de ambas funciones e imprimir el speed-up de su implementación en lenguaje ensamblador respecto a su implementación en C. 

- Codificar correctamente su programa bash `test.sh` con las reglas de compilación correctas. Asimismo, debe ejecutar el programa para los siguientes tamaños de arreglo: `512`, `1024`, `2048`, y `4096`.

- Comentar dentro de su archivo bash acerca de las diferencias entre los tiempos de ejecución para diferentes tamaños de arreglo.

**NOTA: para la generación de números aleatorios, puede utilizar la siguiente función:**
```
void genRandomValues(float *v, int tam){
    float e = 0.0;
    int i = 0;
    for(i = 0; i < tam; i++){
        e = (float)(rand() % tam);
        v[i] = (sinf(e) + cosf(e))*0.707106;
    }
}
```
- Para verificar el correcto funcionamiento de las funciones implementadas, completar el archivo `scriptGDB.gdb` para mostrar los resultados obtenidos por el programa `main.c`. Para ello considere que el archivo `scriptGDB.gdb` debe realizar lo siguiente:
    - Generar el archivo `output.txt`. Dar formato adecuado para que su archivo se entienda y se vean bien las impresiones de los resultados.
    - Ingresar el valor del tamaño del arreglo utilizando `args` en GDB. Para esta verificación utilizar un arreglo de `10` elementos.
    - Mostrar los 10 valores del arreglo resultado de su función en C.
    - Mostrar los 10 valores del arreglo resultado de su función en ASM.
