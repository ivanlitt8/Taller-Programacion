/*
    d) Realice un programa que instancie un evento ocasional y una gira, cargando la
    información necesaria. Luego, para ambos, imprima el costo e invoque al mensaje actuar.
 */
package tema5;

/**
 *
 * @author ivanl
 */
public class Ej03 {
    
    public static void main(String[] args){
        Evento nuevoEvento = new Evento("Eminem",10,"tv","Sony",27);
        System.out.println("El costo del evento de "+nuevoEvento.getNombreBanda()+" es: "+nuevoEvento.calcularCosto());
        System.out.println("Este es el evento de "+nuevoEvento.getNombreBanda());
        System.out.println("-----Temas Evento de "+nuevoEvento.getNombreBanda());
        nuevoEvento.agregarTema("Tema 11");
        nuevoEvento.agregarTema("Tema 22");
        nuevoEvento.agregarTema("Tema 33");
        nuevoEvento.agregarTema("Tema 44");
        nuevoEvento.agregarTema("Tema 55");
        nuevoEvento.agregarTema("Tema 66");
        nuevoEvento.agregarTema("Tema 77");
        nuevoEvento.agregarTema("Tema 88");
        nuevoEvento.agregarTema("Tema 99");
        nuevoEvento.agregarTema("Tema 1010");
        nuevoEvento.actuarDistinto();
        
        System.out.println("///////////////////////////");
        
        Gira nuevaGira = new Gira("Drake",8,"Massive",4);
        
        Fecha fechaUno = new Fecha("Rosario",5);
        Fecha fechaDos = new Fecha("La Plata",8);
        Fecha fechaTres = new Fecha("Bahia Blanca",14);
        Fecha fechaCuatro = new Fecha("Buenos Aires",20);
        
        nuevaGira.agregarFecha(fechaUno);
        nuevaGira.agregarFecha(fechaDos);
        nuevaGira.agregarFecha(fechaTres);
        nuevaGira.agregarFecha(fechaCuatro);      
        
        System.out.println("El costo del evento de "+nuevaGira.getNombreBanda()+" es: "+nuevaGira.calcularCosto());
        
                
        nuevaGira.agregarTema("Tema 1");
        nuevaGira.agregarTema("Tema 2");
        nuevaGira.agregarTema("Tema 3");
        nuevaGira.agregarTema("Tema 4");
        nuevaGira.agregarTema("Tema 5");
        nuevaGira.agregarTema("Tema 6");
        nuevaGira.agregarTema("Tema 7");
        nuevaGira.agregarTema("Tema 8");
        
        
        
        nuevaGira.actuarDistinto();
        nuevaGira.actuarDistinto();
        nuevaGira.actuarDistinto();
        nuevaGira.actuarDistinto();
  
        
        
        
    }
    
}
