#include <pic14/pic12f683.h>

// Configuraciones: Deshabilita MCLR y WDT
unsigned int __at 0x2007 __CONFIG = (_MCLRE_OFF & _WDTE_OFF);

// Prototipos de funciones
void generarAleatorio16(unsigned short *valorActual);
void retardoVisual(unsigned int duracion);
