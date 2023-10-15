/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2023;

/**
 *
 * @author ivanl
 */
public class Cancion {
    private String nombre;
    private String compositor;
    private int id;
    private Estudiante mejorInterprete;
    private int puntaje = 0;

    public Cancion(String nombre, String compositor, int id) {
        this.nombre = nombre;
        this.compositor = compositor;
        this.id = id;
    }
    
    public void intepretarCancion(Estudiante estudiante, int puntaje){
        if(puntaje>this.puntaje){
            this.puntaje = puntaje;
            this.mejorInterprete = estudiante;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCompositor() {
        return compositor;
    }

    public void setCompositor(String compositor) {
        this.compositor = compositor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Estudiante getMejorInterprete() {
        return mejorInterprete;
    }

    public void setMejorInterprete(Estudiante mejorInterprete) {
        this.mejorInterprete = mejorInterprete;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }
    
    public boolean hayInteprete(){
        return (this.mejorInterprete!=null);
    }

    @Override
    public String toString() {
        String aux = "Cancion: "+ nombre + ", compositor: " + compositor + ", id=" + id + 
                ", mejor interprete: ";
        if(hayInteprete()){
            aux += mejorInterprete + "con puntaje " + puntaje;
        }else{
            aux += "Nadie";
        }
        return aux;
    }  
    
}
