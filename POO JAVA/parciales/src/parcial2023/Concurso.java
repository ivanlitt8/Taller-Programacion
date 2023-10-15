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
public class Concurso {

    private Cancion[][] matriz;
    private int categorias;
    private int canciones;

    public Concurso(int categorias, int canciones) {
        this.categorias = categorias;
        this.canciones = canciones;
        this.matriz = new Cancion[categorias][canciones]; // Inicializado por defecto 
    }

    public void agregarCancionAConcurso(int cat, int can, Cancion cancion) {
        this.matriz[cat - 1][can - 1] = cancion;
    }

    public void interpretar(int id, Estudiante estudiante, int puntaje) {
        boolean encontrado = false;
        int categoria = 0;
        int cancion = 0;
        while (categoria < this.categorias && !encontrado) {
            while (cancion < this.canciones && !encontrado) {
                if (notNull(categoria, cancion)) {
                    if (matriz[categoria][cancion].getId() == id) {
                        encontrado = true;
                        matriz[categoria][cancion].intepretarCancion(estudiante, puntaje);
                    }
                }
                cancion++;
            }
            cancion = 0;
            categoria++;
        }
    }

    public Estudiante getGanador(int id) {
        boolean encontrado = false;
        int categoria = 0;
        int cancion = 0;
        Estudiante estudiante = null;
        while (categoria < this.categorias && !encontrado) {
            while (cancion < this.canciones && !encontrado) {
                if (notNull(categoria, cancion)) {
                    if (matriz[categoria][cancion].getId() == id) {
                        encontrado = true;
                        estudiante = matriz[categoria][cancion].getMejorInterprete();
                        return estudiante;
                    }
                }
                cancion++;
            }
            cancion = 0;
            categoria++;
        }
        return estudiante;
    }

    public boolean notNull(int cat, int can) {
        return (this.matriz[cat][can] != null);
    }

    public Cancion cancionMaxPuntaje(int cat) {
        int max = 0;
        Cancion cancionMax = null;
        for (int i = 0; i < this.canciones; i++) {
            if (notNull(cat, i)) {
                if (this.matriz[cat][i].getPuntaje() > max) {
                    max = this.matriz[cat][i].getPuntaje();
                    cancionMax = this.matriz[cat][i];
                }
            }
        }
        return cancionMax;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.categorias; i++) {
            aux += "Cancion con mejor puntaje de categoria numero " + (i + 1)
                    + ": \n" + this.cancionMaxPuntaje(i).toString() + "\n";
        }
        return aux;
    }
}
