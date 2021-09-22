# Problema 2 (9.5 puntos): 

- Escribir un _programa_ en lenguaje ensamblador de **64 bits** para Intel que implemente el juego ahorcado.
- La **palabra** debe estar en el segmento de datos.
- En este segmento también debe estar una cadena de `*` de la misma longitud de la palabra. Cada caracter de esta cadena será reemplazado por el caracter ingresado por el usuario.
- El ingreso, impresion de datos, y salida del programa se debe realizar utilizando llamadas al sistema. 
- El máximo número de errores permitidos es 5. Luego de esto, el programa debe mostrar el mensaje `Perdiste` en el terminal de Linux.
- Si no hay errores y el usuario adivinó la palabra, debe mostrar el mensaje `Ganaste`.

> **NOTA: Imprimir la cadena de asteriscos modificada en cada intento**

## Archivo bash 
- Colocar las reglas necesarias para crear el _object file_ y el ejecutable.
- Colocar una prueba del ejecutable.

## Distribución del puntaje total de la pregunta

| sección       | puntos  | requisitos para puntaje completo |
|:-------:      |:-------:|:-------------:|
| código ASM    | 1.0     | correcta definición de cadenas en el segmento de datos y bss. |
| código ASM    | 1.0     | uso adecuado de las llamadas al sistema para ingreso, impresión de datos, y salida. |
| código ASM    | 3.0     | implementación de la lógica para evaluar si el caracter ingresado está dentro de la cadena en memoria. |
| código ASM    | 4.0     | implementación de la lógica para ganar y perder. |
| bash          | 0.5     | todas las reglas de compilación y ejecución correctas. |
