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
public class Gira extends Recital{
    private String nombreGira;
    private Fecha[] fechaGira;
    private int proximaFecha;
    private int dimL;

    public Gira(String nombreBanda,int cantTemas,String nombreGira,int cantFechas) {
        super(nombreBanda, cantTemas);
        this.fechaGira = new Fecha[cantFechas];
        this.nombreGira = nombreGira;
        this.dimL= 0;
        this.proximaFecha= 0;
    }
    
    public Gira(){
        
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha[] getFechaGira() {
        return fechaGira;
    }

    public void setFechaGira(Fecha[] fechaGira) {
        this.fechaGira = fechaGira;
    }

    public int getProximaFecha() {
        return proximaFecha;
    }

    public void setProximaFecha(int proximaFecha) {
        this.proximaFecha = proximaFecha;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    
    public void agregarFecha(Fecha F){
        fechaGira[dimL]= F;
        this.setDimL(dimL+1);
    }
    
    public void actuarDistinto(){
        System.out.println("Buenas noches …" + fechaGira[proximaFecha].getCiudad());
        System.out.println("La lista de temas para esta fecha son:");
        super.imprimirListaTemas();
        this.setProximaFecha(proximaFecha+1);
    }
   
    public double calcularCosto(){
       return 30000*this.dimL;
    }
    
    public void agregarTemaGira(String nuevoTema){
        super.agregarTema(nuevoTema);
    }
    
}
