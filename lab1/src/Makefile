# Configuración del compilador y microcontrolador
CHIP_FAMILY = -mpic14
DEVICE      = -p12f683
COMPILER    = sdcc
LINKER      = sdcc
OUTPUT_NAME = dice

# Archivos fuente
SOURCES = dice.c

# Regla por defecto: compilar
build:
	$(COMPILER) --use-non-free $(CHIP_FAMILY) $(DEVICE) -o $(OUTPUT_NAME) $(SOURCES)

# Regla para limpiar archivos temporales y de salida
purge:
	rm -f *.c~ *.h~ *.o *.elf *.hex *.asm *.cod *.lst NUL