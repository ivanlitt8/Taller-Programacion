/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author ivanl
 */
public abstract class Recital {
    private String nombreBanda;
    private String[] listaTemas;
    private int dimL;

    public Recital(String nombreBanda, int cantTemas) {
        this.nombreBanda = nombreBanda;
        this.listaTemas = new String[cantTemas];
        this.dimL = 0;
    }
    
    
    public Recital(){
        
    }
    
    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    

    public void agregarTema(String nuevoTema){
        listaTemas[dimL]= nuevoTema;
        this.setDimL(dimL+1);
    }
    
    public void actuar(){
        for (int i=0;i<dimL;i++){
            System.out.println("Y ahora tocaremos…"+ listaTemas[i]);
        }
    }
    
    public void imprimirListaTemas(){
        for (int i=0;i<dimL;i++){
            System.out.println(listaTemas[i]);
        }
    }
    
    
    public abstract double calcularCosto();
    
}
