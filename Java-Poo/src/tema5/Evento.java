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
public class Evento extends Recital {
    private String motivo;
    private String contratante;
    private int dia;

    public Evento(String nombreBanda, int cantTemas,String motivo,String contratante, int dia) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.contratante = contratante;
        this.dia = dia;
    }
    
    public Evento() {
        
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }    
    
    
    public void actuarDistinto(){
        if("beneficencia".equals(motivo)){
            System.out.println("Recuerden colaborar con…"+ this.getContratante());
        }
        if("tv".equals(motivo)){
            System.out.println("Saludos amigos televidentes");
        }
        if("privado".equals(motivo)){
            System.out.println("Un feliz cumpleaños para…"+ this.getContratante());
        }
        super.imprimirListaTemas();
    }
    
    public double calcularCosto(){
        if("beneficencia".equals(motivo)){
            return 0;
        }
        if("tv".equals(motivo)){
            return 50000;
        }
        if("privado".equals(motivo)){
            return 150000;
        }
        else
            return -1;
    }
    
    public void agregarTemaEvento(String nuevoTema){
        super.agregarTema(nuevoTema);
    }
    
    
}
