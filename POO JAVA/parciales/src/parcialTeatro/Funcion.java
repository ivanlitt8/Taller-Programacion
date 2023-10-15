/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialTeatro;

/**
 *
 * @author ivanl
 */
public class Funcion {
    private String titulo;
    private String fecha;
    private String hora;
    private Butaca[][] matriz;
    private int filas;
    private int columnas;

    public Funcion(String titulo, String fecha, String hora, int filas, int columnas) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.filas = filas;
        this.columnas = columnas;
        this.matriz = new Butaca[filas][columnas]; //Inicializado por defecto por Java
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                this.matriz[i][j] = new Butaca(i, j);
            }
        }
    }
    
    public double ocuparButaca(int fila, int columna){
        this.matriz[fila-1][columna-1].setOcuapada(true);
        return this.matriz[fila-1][columna-1].getPrecio();
    }
    
    public void desocuparFila(int fila){
        for (int i = 0; i < this.columnas; i++) {
            this.matriz[fila-1][i].setOcuapada(false);
        }
    }
    
    public String imprimirColumna(int columna){
        String aux = "";
        for (int i = 0; i < this.columnas; i++) {
            aux += this.matriz[i][columna-1]+"\n";
        }
        return aux;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getFilas() {
        return filas;
    }

    public void setFilas(int filas) {
        this.filas = filas;
    }

    public int getColumnas() {
        return columnas;
    }

    public void setColumnas(int columnas) {
        this.columnas = columnas;
    }

    @Override
    public String toString() {
        String aux = "Funcion" + titulo + ", " + fecha + ", a las " + hora + "hs, filas: " + filas +
                ", columnas: " + columnas +"\n";
        
        for (int i = 0; i < this.filas; i++) {
            for (int j = 0; j < this.columnas; j++) {
                aux += this.matriz[i][j] + "--";
            }
            aux += "\n";
        }
        return aux;
    }
    
    
    
    
    
    
    
    
}
