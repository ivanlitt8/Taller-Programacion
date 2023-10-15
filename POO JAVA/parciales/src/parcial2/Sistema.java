/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author ivanl
 */
public class Sistema {
    
    private Paciente[][] matriz;
    private int dias = 5;
    private int turnos = 6;

    public Sistema() {
        this.matriz = new Paciente[this.dias][this.turnos]; // Java inicializa la matriz en null
    }
    
    public void agendarPaciente(Paciente paciente, int dia, int turno){
        this.matriz[dia-1][turno-1]= paciente;
    }
    
    public void liberarTurnos(String nombre){
        for(int i=0;i<this.dias;i++){
            for (int j=0;j<this.turnos;j++) {
                if(this.matriz[i][j]!=null){
                    if(this.matriz[i][j].getNombre().equals(nombre)){
                        this.matriz[i][j] = null;
                    }
                }
            }
        }
    }

    public boolean notNull(int dia, int turno){
        return (matriz[dia][turno] != null);
    }
    
    public boolean tieneTurno(int dia, String nombre){
        boolean esta = false;
        int i = 0;
        while((!esta)&&(i<this.turnos)){
            if(notNull(dia, i)){
                if(matriz[dia][i].getNombre().equals(nombre)){
                    esta= true;
                }
            }
            i++;
        }
        return esta;
    }    
    
}
