/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author ivanl
 */
public class Estanteria {

    private int estantes;
    private int espacios;
    private Libro[][] matriz;

    public Estanteria(int estantes, int espacios) {
        this.estantes = estantes;
        this.espacios = espacios;
        this.matriz = new Libro[estantes][espacios]; // Java inicializa en null la estructura 
    }

    public void almacenarLibro(Libro libro, int estante, int posicion) {
        this.matriz[estante - 1][posicion - 1] = libro;
    }
    
    public Libro getLibro(int fila, int espacio){
        return this.matriz[fila][espacio];
    }

    public Libro sacarLibro (String titulo){
      boolean encontrado = false;
      Libro libro = new Libro();
      int fila = 0;
      int espacio = 0;
      while (fila < this.espacios && !encontrado) {
            while (espacio < this.espacios && !encontrado) {
                if(notNull(fila, espacio)){
                    if (this.matriz[fila][espacio].getTitulo().equals(titulo)) {
                        encontrado = true;
                        libro = matriz[fila][espacio];
                        this.matriz[fila][espacio] = null;
                    }
                }
                espacio++;
            }
            espacio = 0;
            fila++;
        }
      return libro;
    }

    public boolean notNull(int estante, int espacio) {
        return (this.matriz[estante][espacio] != null);
    }

    public Libro calcular() {
        double max = -1;
        Libro libroPesado = null;
        for (int i = 0; i < this.estantes; i++) {
            for (int j = 0; j < this.espacios; j++) {
                if (notNull(i, j)) {
                    if (this.matriz[i][j].getPeso() > max) {
                        max = this.matriz[i][j].getPeso();
                        libroPesado = this.matriz[i][j];
                    }
                }
            }
        }
        return libroPesado;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.estantes; i++) {
            aux += "Estante: " + (i + 1) + " \n";
            for (int j = 0; j < this.espacios; j++) {
                if (notNull(i, j)) {
                    aux += this.matriz[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }

}
