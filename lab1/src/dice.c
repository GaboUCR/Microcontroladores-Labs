#include <pic14/pic12f683.h>

// Configuraciones: Deshabilita MCLR y WDT
unsigned int __at 0x2007 __CONFIG = (_MCLRE_OFF & _WDTE_OFF);

// Prototipos de funciones
void generarAleatorio16(unsigned short *valorActual);
void retardoVisual(unsigned int duracion);


// Función para generar números pseudoaleatorios con LFSR de 16 bits
void generarAleatorio16(unsigned short *valorActual) {
    // Verifica si el bit menos significativo es 1
    if ((*valorActual) & 1) {
        // Desplaza a la derecha
        (*valorActual) >>= 1;
        // Hace XOR con la máscara para retroalimentar bits
        (*valorActual) ^= (1 << 15) | (1 << 14) | (1 << 12) | (1 << 3);
    } else {
        // Desplaza a la derecha sin aplicar la máscara
        (*valorActual) >>= 1;
    }
}

// Función para crear un retardo basado en bucles
void retardoVisual(unsigned int duracion) {
    unsigned int i, j;
    for (i = 0; i < duracion; i++) {
        for (j = 0; j < 256; j++) {
            // No se hace nada en este bucle interno
        }
    }
}
