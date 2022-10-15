/*

 */
package tema5;

/**
 *
 * @author ivanl
 */
public class Estacionamiento {
    private String nombre;
    private String dirección;
    private double horaApertura;
    private double horaCierre;
    private int pisos;
    private int plazas;
    private Auto[][] espacio;

    /*
    
    Otro constructor debe recibir nombre, dirección, hora de apertura, hora de
    cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
    estacionamiento con los datos recibidos y sin autos.  
    
    */

    public Estacionamiento(String nombre, String dirección) {
        this.nombre = nombre;
        this.dirección = dirección;
        this.horaApertura = 8;
        this.horaCierre = 21;
        this.pisos = 5;
        this.plazas = 10;
        this.espacio = new Auto[pisos][plazas];
    }

    public Estacionamiento(String nombre, String dirección, double horaApertura, double horaCierre, int pisos, int plazas) {
        this.nombre = nombre;
        this.dirección = dirección;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.pisos = pisos;
        this.plazas = plazas;
        this.espacio = new Auto[pisos][plazas];
    }
    
    
    public String getNombre() {
        return nombre;
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

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirección() {
        return dirección;
    }

    public void setDirección(String dirección) {
        this.dirección = dirección;
    }

    public double getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(double horaApertura) {
        this.horaApertura = horaApertura;
    }

    public double getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(double horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Auto[][] getEspacio() {
        return espacio;
    }

    public void setEspacio(Auto[][] espacio) {
        this.espacio = espacio;
    }
  
    
    public void registrarAuto(Auto A,int X,int Y){
        espacio[X][Y] = A;
    }
    
    public String buscarAuto(String patente){
        boolean esta = false;
        int pisoAct = 0;
        int plazaAct = 0;
        for (int i=0;i<pisos;i++){
            for(int j=0;j<plazas;j++){
                if(espacio[i][j]!=null){
                    if(espacio[i][j].getPatente().equals(patente)){
                        esta = true;
                        pisoAct = i;
                        plazaAct = j;
                    }
                }
            }
        }
        if(esta == false){
            String aux = " Auto inexistente. ";
            return aux;
        }else{
            String aux = "El auto se encuentra en el piso " + pisoAct + " plaza "+ plazaAct;
            return aux;
        }
        
    }
    
    public void imprimirEstacionamiento(){
        for (int i=0;i<pisos;i++){
            System.out.println("Piso "+(i+1));
            for(int j=0;j<plazas;j++){
                if(espacio[i][j] == null){
                    System.out.println("Plaza "+ (j+1) + ": libre ");
                }else{
                    System.out.println("Plaza "+ (j+1) + ": "+ espacio[i][j].toString());
                }
            }
        }
    }

    public int autosEnPlaza(int plaza){
        int cant = 0;
        for (int i=0;i<pisos;i++){
            if(espacio[i][plaza] != null){
                cant++;
            }
        }
        return cant;
    }
    
}
