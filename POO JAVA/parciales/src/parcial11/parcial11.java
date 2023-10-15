/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11;

/**
 *
 * @author ivanl
 */
public class parcial11 {

    /**
     */
    public static void main(String[] args) {
        
        Torneo torneo = new Torneo("Libertadores", 5,6);

        Goleador goleador1 = new Goleador("Messi", "Boca", 35);
        Goleador goleador2 = new Goleador("Aguero", "Racing", 5);
        Goleador goleador3 = new Goleador("Di Maria", "Colon", 12);
        Goleador goleador4 = new Goleador("Salah", "Talleres", 30);
        Goleador goleador5 = new Goleador("Barco", "PSG", 2);
        Goleador goleador6 = new Goleador("Tevez", "Boca", 9);
        Goleador goleador7 = new Goleador("Riquelme", "Boca", 10);
        Goleador goleador8 = new Goleador("Hurtado", "River", 6);
        
        torneo.agregarJugador(2, goleador1);
        torneo.agregarJugador(2, goleador2);
        torneo.agregarJugador(1, goleador3);
        torneo.agregarJugador(4, goleador4);
        torneo.agregarJugador(5, goleador5);
        torneo.agregarJugador(2, goleador6);
        torneo.agregarJugador(1, goleador7);
        torneo.agregarJugador(1, goleador8);
        
        
        System.out.println("El goleador con menos goles en la fecha 2 es: "+torneo.menosGoleadorFecha(2));
        System.out.println(torneo);
        System.out.println("El total de goles de todo el torneo es: "+torneo.totalGoles());
    }

}
