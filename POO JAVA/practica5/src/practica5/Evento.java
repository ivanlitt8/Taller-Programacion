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
public class Evento extends Recital{
    
    private String contratante;
    private Fecha dia;
    private String motivo;
    private String[] motivos = {"a beneficio", "show de TV", "show privado"};

    public Evento(String banda, int cantTemas, String motivo, String contatante, int dia) {
        super(banda, cantTemas);
        this.motivo = motivo;
        this.contratante = contatante;
        this.dia = new Fecha(dia);
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia.getDia();
    }

    public void setDia(int dia) {
        this.dia.setDia(dia);
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }   

    @Override
    public String actuar() {
        String mensaje = "";
        if(this.motivos[2] == this.motivo){
            mensaje += "Un feliz cumpleaños para..."+this.contratante+"\n";
        }else{
            if(this.motivos[1] == this.motivo){
                mensaje += "Saludos amigos televidentes \n";
            }else{
                mensaje += "Recuerden colaborar con..."+this.contratante+"\n";
            }
        }
        return mensaje+imprimirListadoTemas()+super.actuar()+"\n";
    }

    @Override
    public double calcularCosto() {
        double costo = 0;
        if(this.motivos[2] == this.motivo){
            costo += 150000;
        }else{
            if(this.motivos[1] == this.motivo){
                 costo += 50000;
            }
        }
        return costo;
    }  
}

/**
    iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo 
            siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un
            show de TV y 150000 si es privado. Las giras deben devolver 30000 por cada fecha 
            de la misma.
 */