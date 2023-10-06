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
public class Gira extends Recital {

    private String nombreGira;
    private Fecha[] fechas;
    private int cantFechas;
    private int actual = 0;
    private int dimL = 0;

    public Gira(String nombreGira, int cantFechas, String banda, int cantTemas) {
        super(banda, cantTemas);
        this.nombreGira = nombreGira;
        this.cantFechas = cantFechas;
        this.fechas = new Fecha[cantFechas];
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public int getDimL() {
        return dimL;
    }

    public void agregarFecha(Fecha fecha) {
        if (dimL < cantFechas) {
            fechas[dimL] = fecha;
            dimL++;
        }
    }

    public void siguienteFecha() {
        if (actual <= dimL) {
            actual++;
        }
    }

    @Override
    public String actuar() {
        siguienteFecha();
        return "Buenas noches …" + this.fechas[actual - 1].getCiudad() + " " +
                imprimirListadoTemas()+"\n"+super.actuar()+"\n";
    }

    @Override
    public double calcularCosto() {
        return 30000 * this.getCantFechas();
    }

}


/**
    iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo 
            siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un
            show de TV y 150000 si es privado. Las giras deben devolver 30000 por cada fecha 
            de la misma.
 */
