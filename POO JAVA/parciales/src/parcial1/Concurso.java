/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author ivanl
 */
public class Concurso {
    private int N;
    private int dimL = 0;
    private Pareja[] parejas;

    public Concurso(int N) {
        this.N = N;
        this.parejas = new Pareja[N];
    }
    
    public void agregarPareja(Pareja pareja){
        if(dimL<N){
            this.parejas[this.dimL] = pareja;
            this.dimL++;
        }
    }
    
    public int maxDifEdad(){
        int max = 0;
        int pareja = -1;
        for(int i=0;i<dimL;i++){
            if(parejas[i].getDiferenciaEdad()>max){
                max = parejas[i].getDiferenciaEdad();
                pareja = i+1;
            }
        }
        return pareja;
    }

    
    
    
}
