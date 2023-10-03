/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author ivanl
 */
public class RepMensual extends Sistema {

    private String[] meses = new String[]{"Enero", "Febrero", "Marzo",
        "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
        "Octubre", "Noviembre", "Diciembre"};

    public RepMensual(int anioInicial, int cantAnios, Estacion estacion) {
        super(anioInicial, cantAnios, estacion);
    }

    public String retornarMedia() {
        String aux = "";
        double total;
        for (int j=0;j<12;j++){
            total = 0;
            for(int i=0;i<this.getCantAnios();i++){
                total += obtenerTemp(j,i);            
            }
            aux += meses[j]+": "+Math.round((total/this.getCantAnios())*100)/100.0+"°C \n";
        }
        return aux;
    }
        
    @Override
    public String toString() {
        return super.toString();
    }

}
