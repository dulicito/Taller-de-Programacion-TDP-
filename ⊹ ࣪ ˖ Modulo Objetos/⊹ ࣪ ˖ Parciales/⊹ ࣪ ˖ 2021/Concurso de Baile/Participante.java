public class Participante {

    private int dni;
    private String nombre;
    private int edad;
    
    public Participante (int dni, String nombre, int edad){
        this.dni = dni;
        this.nombre = nombre;
        this.edad = edad;
    }

    public int getEdad() {
        return edad;
    }

}
