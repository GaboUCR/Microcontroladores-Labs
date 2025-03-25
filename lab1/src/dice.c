#include <pic14/pic12f683.h>

// Configuraciones: Deshabilita MCLR y WDT
unsigned int __at 0x2007 __CONFIG = (_MCLRE_OFF & _WDTE_OFF);

// Prototipos de funciones
void generarAleatorio16(unsigned short *valorActual);
void retardoVisual(unsigned int duracion);

void main(void) {
    // Configura GP0, GP1, GP2, GP3 y GP4 como salidas; GP5 como entrada
    TRISIO = 0b00100000;
    
    // Inicializa todos los pines en bajo
    GPIO = 0b00000000;
    
    // Un valor de 2000 produce un retraso aproximado de 1 segundo en simulación
    unsigned int retardo = 2000;
    unsigned short semilla = 1;      // Semilla para el generador LFSR
    unsigned short *ptrSemilla = &semilla;
    unsigned short caraDado = 0;     // Almacena la cara resultante del dado
    
    while (1) {
        // Si se presiona el botón (GP5 en alto)
        if (GP5) {
            switch (caraDado) {
                case 1:
                    // Enciende el pin correspondiente
                    GPIO = 0b00000010;
                    retardoVisual(retardo);
                    // Apaga el pin
                    GPIO = 0b00000000;
                    break;
                case 2:
                    GPIO = 0b00000001;
                    retardoVisual(retardo);
                    GPIO = 0b00000000;
                    break;
                case 3:
                    GPIO = 0b00000011;
                    retardoVisual(retardo);
                    GPIO = 0b00000000;
                    break;
                case 4:
                    GPIO = 0b00010001;
                    retardoVisual(retardo);
                    GPIO = 0b00000000;
                    break;
                case 5:
                    GPIO = 0b00010110;
                    retardoVisual(retardo);
                    GPIO = 0b00000000;
                    break;
                case 6:
                    GPIO = 0b00011001;
                    retardoVisual(retardo);
                    GPIO = 0b00000000;
                    break;
                default:
                    // No se hace nada por defecto
                    break;
            }
        } else {
            // Apaga todas las salidas
            GPIO = 0b00000000;
            // Genera un número aleatorio de 16 bits
            generarAleatorio16(ptrSemilla);
            // Ajusta la cara del dado entre 1 y 6
            caraDado = 1 + (semilla % 6);
        }
    }
}

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
