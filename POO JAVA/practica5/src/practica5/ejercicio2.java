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
import PaqueteLectura.Lector;
public class ejercicio2 {

    /**
     * 2- Queremos un sistema para gestionar estacionamientos. Un
     * estacionamiento conoce su nombre, dirección, hora de apertura, hora de
     * cierre, y almacena para cada número de piso (1..N) y número de plaza
     * (1..M), el auto que ocupa dicho lugar. De los autos se conoce nombre del
     * dueño y patente.
     *
     * a) Genere las clases, incluyendo getters y setters adecuados.
     *
     * b) Implemente constructores. En particular, para el estacionamiento:
     *
     * - Un constructor debe recibir nombre y dirección, e iniciar el
     * estacionamiento con hora de apertura “8:00”, hora de cierre “21:00”, y
     * para 5 pisos y 10 plazas por piso. El estacionamiento inicialmente no
     * tiene autos.
     *
     * - Otro constructor debe recibir nombre, dirección, hora de apertura, hora
     * de cierre, el número de pisos (N) y el número de plazas por piso (M) e
     * iniciar el estacionamiento con los datos recibidos y sin autos. * c)
     * Implemente métodos para: * - Dado un auto A, un número de piso X y un
     * número de plaza Y, registrar al auto en el estacionamiento en el lugar
     * X,Y. Suponga que X, Y son válidos (es decir, están en rango 1..N y 1..M
     * respectivamente) y que el lugar está desocupado.
     *
     * - Dada una patente, obtener un String que contenga el número de piso y
     * plaza donde está dicho auto en el estacionamiento. En caso de no
     * encontrarse, retornar el mensaje “Auto Inexistente”.
     *
     * - Obtener un String con la representación del estacionamiento. Ejemplo:
     * “Piso 1 Plaza 1: libre Piso 1 Plaza 2: representación del auto … Piso 2
     * Plaza 1: libre … etc”
     *
     * - Dado un número de plaza Y, obtener la cantidad de autos ubicados en
     * dicha plaza (teniendo en cuenta todos los pisos).
     *
     * d) Realice un programa que instancie un estacionamiento con 3 pisos y 3
     * plazas por piso. Registre 6 autos en el estacionamiento en distintos
     * lugares. Muestre la representación String del estacionamiento en consola.
     * Muestre la cantidad de autos ubicados en la plaza 1. Lea una patente por
     * teclado e informe si dicho auto se encuentra en el estacionamiento o no.
     * En caso de encontrarse, la información a imprimir es el piso y plaza que
     * ocupa.
     */
    public static void main(String[] args) {
        Estacionamiento est1 = new Estacionamiento("Centenario", "Diagonal 73 1611");

        Estacionamiento est2 = new Estacionamiento("Catedral", "Calle 12 1821", "06:00", "23:00", 3, 3);

        Auto auto1 = new Auto("Marcelo", "AKZ-356");
        Auto auto2 = new Auto("Pedro", "HJI-489");
        Auto auto3 = new Auto("Mariana", "OKP-805");
        Auto auto4 = new Auto("Omar", "AKZ-717");
        Auto auto5 = new Auto("Hector", "FAR-133");
        Auto auto6 = new Auto("Jaime", "JPQ-518");

        est2.registrarAuto(1, 3, auto1);
        est2.registrarAuto(2, 2, auto2);
        est2.registrarAuto(1, 2, auto3);
        est2.registrarAuto(3, 1, auto4);
        est2.registrarAuto(2, 2, auto5);
        est2.registrarAuto(3, 3, auto6);
        
        System.out.println(est2);
        
        System.out.println("Ingrese patente a buscar: ");
        System.out.println(est2.buscarAuto(PaqueteLectura.Lector.leerString()));       

    }

}
