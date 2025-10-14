
package parciales.TL;

public class Participante {
    private String nombre;
    private String email;
    private int contraseñaIngresada;
    
    //2 constructores
    public Participante(String nombre, String email) {
        this.nombre = nombre;
        this.email = email;
        this.contraseñaIngresada = 0;
    }

    public Participante(String nombre, String email, int contraseñaIngresada) {
        this.nombre = nombre;
        this.email = email;
        this.contraseñaIngresada = contraseñaIngresada;
    }
    //setters y getters necesarios 

    public String getNombre() {
        return nombre;
    }

    public String getEmail() {
        return email;
    }

    public int getContraseñaIngresada() {
        return contraseñaIngresada;
    }

    
    //to string 

    @Override
    public String toString() {
        String aux = "Nombre: "+ this.getNombre()+ 
                "Email: "+this.getEmail();
        return aux;
    }
    
    
}
