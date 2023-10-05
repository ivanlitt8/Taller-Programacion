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
public class Proyecto {
    private String nombreProyecto;
    private int codigo;
    private String nombreDirector; 
    private int dimL = 0;
    private Investigador[] equipo;       

    public Proyecto(String nombreProyecto, int codigo, String nombreDirector) {
        this.nombreProyecto = nombreProyecto;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.equipo = new Investigador[50]; //Se inicializa por defecto todas las posiciones en null
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public boolean hayEspacio(){
        return (dimL<50);
    }
    
    public void agregarInvestigador(Investigador investigador){
        if(hayEspacio()){
            equipo[dimL] = investigador;
            dimL++;
        }
    }
    
    public double dineroTotalOtorgado(){
        int total = 0;
        for(int i=0;i<dimL;i++){
            total += this.equipo[i].totalSubsidios();
        }
        return total;
    }
    
    public void otorgarTodos(String nombre){
        int i = 0;
        while((!this.equipo[i].getNombre().equals(nombre))&&(i<=dimL)){
            i++;
        }
        if(this.equipo[i].getNombre().equals(nombre)){
            this.equipo[i].habilitarSubsidios();
        }
    }
    
    public String mostrarEquipo(){
        String aux = "";
        for(int i=0;i<dimL;i++){
            aux += equipo[i].toString();
        }
        return aux;
    }

    @Override
    public String toString() {
        return "Proyecto: " + nombreProyecto + ", Codigo " + codigo + ", Director: " + nombreDirector + 
                "\nPresupuesto total = " + this.dineroTotalOtorgado() + "$ \nEquipo: \n" + this.mostrarEquipo() ;
    }
    
}
