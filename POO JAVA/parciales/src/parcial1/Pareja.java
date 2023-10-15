/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author ivanl
 */
public class Pareja {
    private Participante[] pareja;

    public Pareja(Participante part1, Participante part2) {
        this.pareja = new Participante[2];
        this.pareja[0] = part1;
        this.pareja[1] = part2;
    }
    
    public int getDiferenciaEdad(){
        return Math.abs(this.pareja[0].getEdad())-(this.pareja[1].getEdad());
    }   
    
    
}
