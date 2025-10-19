//Declaración de clase abstracta: anteponer abstract a la palabra class.
public abstract class NombreClase {
    /* Definir atributos */
    /* Definir métodos no abstractos (con implementación) */
    /* Definir métodos abstractos (sin implementación) */
}

//Declaración de método abstracto: encabezado del método (sin código) anteponiendo 
//abstract al tipo de retorno.

public abstract TipoRetorno nombreMetodo(lista parámetros formales);


//ejemplo:
public abstract class Figura{

...
public abstract double calcularArea();
public abstract double calcularPerimetro();
}