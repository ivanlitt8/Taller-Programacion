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
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String apertura;
    private String cierre;
    private int pisos;
    private int plazas;
    private Auto[][] matriz;

    public Estacionamiento(String nombre, String direccion, String apertura, String cierre,
            int pisos, int plazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.apertura = apertura;
        this.cierre = cierre;
        this.pisos = pisos;
        this.plazas = plazas;
        this.matriz = new Auto[pisos][plazas]; // Java inicializa la matriz por defecto
    }

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.apertura = "8:00";
        this.cierre = "21:00";
        this.pisos = 5;
        this.plazas = 10;
        this.matriz = new Auto[5][10]; // Java inicializa la matriz por defecto
    }    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getApertura() {
        return apertura;
    }

    public void setApertura(String apertura) {
        this.apertura = apertura;
    }

    public String getCierre() {
        return cierre;
    }

    public void setCierre(String cierre) {
        this.cierre = cierre;
    } 

    public int getPisos() {
        return pisos;
    }

    public void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    
    public void registrarAuto(int piso, int plaza, Auto auto){
        this.matriz[piso-1][plaza-1] = auto;
    }
    
    public String buscarAuto (String patente){
        boolean encontrado = false;
        int piso = -1;
        int plaza = -1;
        for(int i=0;i<pisos;i++){
            for(int j=0;j<plazas;j++){
                if(!plazaLibre(i, j)){
                    if(this.matriz[i][j].getPatente().equals(patente)){
                        encontrado = true;
                        piso = i;
                        plaza = j;
                    }
                }
            }
        }
        if(!encontrado){
            return "Auto Inexistente";
        }else{
            return "Auto ubicado en piso "+(piso+1)+" plaza "+(plaza+1);
        }
    }
    
    public boolean plazaLibre(int piso, int plaza){
        return (null == this.matriz[piso][plaza]);
    }
    
    public int autosEnPlaza(int plaza){
        int total = 0;
        for(int i=0;i<pisos;i++){
            if(plazaLibre(i, plaza)){
                total++;
            }
        }
        return total;
    }
    
    public String mostrarEstacionamiento(){
        String aux = "";
        for(int i=0;i<pisos;i++){
            for(int j=0;j<plazas;j++){
                if(plazaLibre(i, j)){
                  aux += "Piso "+(i+1)+" Plaza "+(j+1)+": libre - ";
                }else{
                  aux += "Piso "+(i+1)+" Plaza "+(j+1)+": "+ this.matriz[i][j].toString() +" - ";
                }
            }
            aux += "\n";
        }
        return aux;
    }

    @Override
    public String toString() {
        return mostrarEstacionamiento();
    }
    
}
