/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

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
    
    public void agendarPaciente(Paciente paciente, int dia, int turno ){
        this.matriz[dia-1][turno-1] = paciente;
    }
    
    public boolean notNull(int dia, int turno){
        return (this.matriz[dia][turno] != null);
    }
    
    public void liberarTurnos(String nombre){
        for (int i = 0; i < this.dias; i++) {
            for (int j = 0; j < this.turnos; j++) {
                if(notNull(i,j)){
                    if(this.matriz[i][j].getNombre().equals(nombre)){
                        this.matriz[i][j] = null;
                    }
                }
            }
        }
    }
    
    public boolean tieneTurno(String nombre, int dia){
        boolean state = false;
        int i = 0;
        while ((!state) && (i<this.turnos)){
            if(notNull(dia-1,i)){
                if(this.matriz[dia-1][i].getNombre().equals(nombre)){
                    state = true;
                }
            }
            i++;
        }
        return state;
    }
}
