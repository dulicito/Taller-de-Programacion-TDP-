//¿Cómo defino una relación de herencia? Palabra clave extends.

public class ClaseA{
/* Definir atributos propios */
/* Definir constructores propios */
/* Definir métodos propios */
}

public class ClaseB extends ClaseA{
/* Definir atributos propios */
/* Definir constructores propios */
/* Definir métodos propios */
}

//La ClaseB (subclase de ClaseA) hereda los atributos y métodos de instancia declarados en la ClaseA

//Aclaración: Los atributos declarados en una superclase como privados no son accesibles en sus subclases.
//Para accederlos en una subclase se deben usar los getters y setters.