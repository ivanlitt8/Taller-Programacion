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
public abstract class Recital {
    private String banda;
    private int cantTemas;
    private int dimL = 0;
    private int actual = 0;
    private String[] temas;

    public Recital(String banda, int cantTemas) {
        this.banda = banda;
        this.cantTemas = cantTemas;
        this.temas = new String[cantTemas];
    }
    
    public String getBanda() {
        return banda;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public int getDimL() {
        return dimL;
    }    

    public void setBanda(String banda) {
        this.banda = banda;
    }

    public void agregarTema(String nombre){
        if(dimL<cantTemas){
            temas[dimL] = nombre;
            dimL++;
        }
    }
    
    public String imprimirListadoTemas(){
        String aux = "Temas: \n";
        for(int i=0;i<dimL;i++){
            aux += this.temas[i] + "\n";
        }
        return aux;
    }
    
    public void siguienteTema(){
        if(actual<=dimL){
            actual++;
        }
    }
    
    public String actuar(){
        siguienteTema();
        return "y ahora tocaremos…"+this.temas[actual-1];
    }
    
    public abstract double calcularCosto();
    
}


/**
    iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo 
            siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un
            show de TV y 150000 si es privado. Las giras deben devolver 30000 por cada fecha 
            de la misma.
 */