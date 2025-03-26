# Proyecto: Dado Electrónico con PIC12f683  
**Curso:** IE-0624 
**Estudiante:** Gabriel Gamboa Vargas  
**Carné:** B73098  

---

## Descripción

Este repositorio contiene el desarrollo completo de un dado electrónico implementado con un microcontrolador PIC12f683. El sistema genera un número pseudoaleatorio entre 1 y 6, visualizado mediante una matriz de LEDs, y es activado mediante un pulsador. Se utilizó lenguaje C y simulación con **SimulIDE**.

---

## Requisitos

- SimulIDE (versión reciente)
- Compilador SDCC
- Make (para automatizar compilación)
- Git

---

## Estructura del repositorio

- `src/` — Contiene el código fuente en C, el archivo de simulación `.simu` y el `Makefile`.
- `informe/` — Reporte del laboratorio y diagramas.
- `README.md` — Guía de uso y descripción del proyecto.

---

## Guía de uso

Para ejecutar y simular correctamente el dado, seguí los siguientes pasos:

1. **Cloná el repositorio:**

   ```bash
   git clone https://github.com/GaboUCR/Microcontroladores-Labs.git

2. **Accedé a la carpeta** `src`:

   ```bash
   cd lab1/src

3. **Compila el proyecto usando make**:
    ```bash
    make

4. **Abre el simulador SimulDE**.

5. **Carga el archivo .simu**.

6. **En el microcontrolador PIC12f683 del simulado**:

Click izquierdo al microcontrolador y cargar el archivo .hex.

7. **Inicia la simulacion**:
Presione el boton para obtener un valor en el dado.

