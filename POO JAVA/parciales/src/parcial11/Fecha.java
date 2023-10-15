/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11;

/**
 *
 * @author ivanl
 */
public class Fecha {

    private Goleador[] goleadores;
    private int cantGoleadores = 0;

    public Fecha(int M) {
        this.goleadores = new Goleador[M];
    }
    
    public int getCantGoleadores() {
        return cantGoleadores;
    }

    private void setCantGoleadores(int cantGoleadores) {
        this.cantGoleadores = cantGoleadores;
    }

    public void agregarGoleador(Goleador goleador) {
        this.goleadores[cantGoleadores] = goleador;
        this.cantGoleadores++;
    }

    public int golesJugador(int x) {
        return this.goleadores[x].getGoles();
    }
    
    public boolean notNull(int i){
        return (this.goleadores[i] != null);
    }
    
    public int golesFecha(){
        int goles = 0;
        for (int i = 0; i < this.cantGoleadores; i++) {
           goles += this.goleadores[i].getGoles();
        }
        return goles;
    }
    
    public Goleador menosGoleador(){
        int min = 99;
        Goleador goleador = null;
        for (int i = 0; i < this.cantGoleadores; i++) {
            if(notNull(i)){
                if(this.goleadores[i].getGoles()<min){
                    min = this.goleadores[i].getGoles();
                    goleador = this.goleadores[i];
                }
            }
        }
        return goleador;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < cantGoleadores; i++) {
            aux += this.goleadores[i]+"\n";
        }
        return aux;
    }

}
