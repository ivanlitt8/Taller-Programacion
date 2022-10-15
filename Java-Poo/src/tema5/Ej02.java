/*
    Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso.
    Registre 6 autos en el estacionamiento en distintos lugares.

    Muestre la representación String del estacionamiento en consola.

    Muestre la cantidad de autos ubicados en la plaza 1.
    Lea una patente por teclado e informe si dicho auto se encuentra en el
    estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
    plaza que ocupa
 */
package tema5;
import PaqueteLectura.Lector;

/**
 *
 * @author ivanl
 */
public class Ej02 {
    public static void main(String[] args){
        
        Estacionamiento nuevoEst = new Estacionamiento("Estacionamiento Prueba ","Calle 1 nro 1520", 8.00 , 22.00 , 3, 3 );
        Auto autoUno = new Auto ("DuenioUno","AA-589");
        Auto autoDos= new Auto ("DuenioDos","GB-362");
        Auto autoTres = new Auto ("DuenioTres","PZ-148");
        Auto autoCuatro = new Auto ("DuenioCuatro","TF-917");
        Auto autoCinco = new Auto ("DuenioCinco","UY-250");
        Auto autoSeis = new Auto ("DuenioSeis","AK-874");

        nuevoEst.registrarAuto(autoUno,0,1);
        nuevoEst.registrarAuto(autoDos,0,2);
        nuevoEst.registrarAuto(autoTres,2,2);
        nuevoEst.registrarAuto(autoCuatro,1,0);
        nuevoEst.registrarAuto(autoCinco,1,2);
        nuevoEst.registrarAuto(autoSeis,2,1);

        nuevoEst.imprimirEstacionamiento();
        
        System.out.println("La cantidad de autos en la plaza 1 es: "+nuevoEst.autosEnPlaza(1));
        
        System.out.println("Ingrese Patente del Auto");
        String patente = Lector.leerString();
        
        System.out.println(nuevoEst.buscarAuto(patente));

    }
    
}
