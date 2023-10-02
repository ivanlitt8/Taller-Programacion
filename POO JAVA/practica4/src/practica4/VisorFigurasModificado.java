/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author ivanl
 */
public class VisorFigurasModificado {

    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura[] vector;

    public VisorFigurasModificado() {
        this.guardadas = 0;
        this.vector = new Figura[5];
        for(int i= 0; i<5; i++){
            this.vector[i] = null;
        }
    }

    public void guardar(Figura f) {
        if(quedaEspacio()){
            vector[guardadas] = f;
            guardadas++;
        }
    }

    public boolean quedaEspacio() {
        return (guardadas<=4);
    }

    public void mostrar() {
        for (int i=0;i<guardadas;i++){
            System.out.println(vector[i]);
        }
    }

    public int getGuardadas() {
        return guardadas;
    }

}
