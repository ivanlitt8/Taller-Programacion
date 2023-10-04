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
public class Investigador {

    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int dimL = 0;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[5]; //Se inicializa por defecto todas las posiciones en null
        if (categoria >= 1 && categoria <= 5) {
            this.categoria = categoria;
        } else {
            throw new IllegalArgumentException("La categoría debe estar en el rango de 1 a 5");
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public void agregarSubsidio(double monto, String motivo) {
        if(limiteSubsidios()){
            this.subsidios[this.dimL] = new Subsidio(monto, motivo);
            this.dimL++;
        }
    }
    
    public boolean limiteSubsidios(){
        return (dimL<5);
    }
    
    public double totalSubsidios(){
        double total = 0;
        for (int i=0;i<dimL;i++){
            if(this.subsidios[i].isEstado()){
                total += this.subsidios[i].getMonto();
            }
        }
        return total;
    }
    
    public void habilitarSubsidios(){
        for (int i=0;i<dimL;i++){
            if(!this.subsidios[i].isEstado()){
                this.subsidios[i].setEstado(true);
            }
        }
    }

    @Override
    public String toString() {
        return "Investigador: " + nombre + ", categoria: " + categoria + 
                ", especialidad: " + especialidad + " Total Subsidiado = "+this.totalSubsidios()+"$ \n";
    }
  
}
