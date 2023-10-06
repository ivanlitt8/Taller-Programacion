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
public class CoroSemicircular extends Coro {
    
    private int dimL = 0;
    private int coristas;
    private Corista[] coro;

    public CoroSemicircular(int coristas, String nombre, Director director) {
        super(nombre, director);
        this.coristas = coristas;
        this.coro = new Corista[coristas];
    }

    @Override
    public void agregarCorista(Corista corista) {
        if(!coroLLeno()){
            coro[dimL] = corista;
            dimL++;
        }
    }

    @Override
    public boolean coroLLeno() {
        return (dimL==coristas-1);
    }

    @Override
    public boolean coroBienFormado() {
        boolean state = true;
        for(int i=0;i<dimL-1;i++){
            if(coro[i].getTono()<coro[i+1].getTono()){
                state = false;
            }
        }
        return state;
    }
  
}
