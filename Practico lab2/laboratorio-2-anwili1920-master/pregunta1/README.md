# Problema 1 (5.5 puntos):

Para el desarrollo de esta pregunta, utilizaremos la siguiente ecuación que corresponde a una serie notable:

![formula](https://render.githubusercontent.com/render/math?math=\color{red}\Huge{\sum_{i}^{n}i^2%20=%20\frac{n(n%2B1)(2n%2B1)}{6}})

- Escribir 1 _programa_ en lenguaje ensamblador de **64 bits** para Intel con las siguientes características:

| nombre del programa       | archivo           | observaciones |
|:-------:      |:-------:          |:-------------:|
| iterativoASM  | iterativoASM.asm  | la función está en lenguaje ensamblador e implementa el término izquierdo de la igualdad. |

- Los valores de `n` deben ser leídos de memoria y los resultados respectivos deben almacenarse en memoria de datos **no inicializada**. 
- No es necesaria la impresión de algún mensaje o de los resultados en el terminal de Linux.

> **NOTA: escribir un archivo bash que permita verificar toda su implementación**

## Uso de GDB

- Escribir un _script_ GDB que permita verificar el correcto funcionamiento de su programa `iterativoASM.asm`.
- Debe imprimir los valores de la variable `n`, así como los resultados respectivos.

## Archivo bash 
- Colocar las reglas necesarias para crear el _object file_ y el ejecutable.
- Ejecutar el _script_ de GDB.

## Distribución del puntaje total de la pregunta

| sección       | puntos  | requisitos para puntaje completo |
|:-------:      |:-------:|:-------------:|
| iterativoASM  | 1.5       | implementación (uso adecuado de los segmentos de programa) y funcionamiento correctos. |
| script gdb    | 3.5       | codificación, ejecución correcta del _script_, y reporte. |
| bash          | 0.5       | todas las reglas de compilación y ejecución correctas. |
