/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author ivanl
 */
public class CoroHilera extends Coro {

    private int dimL = 0;
    private int filas;
    private int columnas;
    private int espacios;
    private Corista[][] coro;

    public CoroHilera(int filas, int columnas, String nombre, Director director) {
        super(nombre, director);
        this.columnas = columnas;
        this.filas = filas;
        this.espacios = filas * columnas;
        this.coro = new Corista[filas][columnas];
    }

    @Override
    public boolean coroLLeno() {
        return (dimL == espacios - 1);
    }

    @Override
    public boolean coroBienFormado() {
        return ((verificarFilas()) && (verificarColumnas()));
    }

    public boolean verificarFilas() {
        boolean state = true;
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas - 1; j++) {
                if (coro[i][j].getTono() != coro[i][j + 1].getTono()) {
                    state = false;
                }
            }
        }
        return state;
    }

    public boolean verificarColumnas() {
        boolean state = true;
        for (int i = 0; i < filas - 1; i++) {
            if (coro[i][0].getTono() != coro[i + 1][0].getTono()) {
                state = false;
            }
        }
        return state;
    }

    @Override
    public void agregarCorista(Corista corista) {
        if(!coroLLeno()){
            
        }
    }

}
