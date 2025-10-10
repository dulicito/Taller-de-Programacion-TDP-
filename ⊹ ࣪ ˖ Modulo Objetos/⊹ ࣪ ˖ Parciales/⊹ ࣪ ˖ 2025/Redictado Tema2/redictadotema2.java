public class redictadotema2{
    public static void main(String[] args) {
        // nombre instructor, sueldo, costo de inscripcion, dimF, nombre del bañero, sueldo del bañero
        Nadador n = new Nadador("nombreInstructorNadador", 100, 6000, 2, "nombreBañeroNadador", 20);
        
        // nombre instructor, sueldo, costo de inscripcion, dimF, costo del alquiler
        Explorador e = new Explorador("nombreInstructorExplorador", 100, 1000, 3, 50);
        
        // agrego a nadadores
        Chico c = new Chico("chico1", 123, true);
        n.agregarChico(c);
        c = new Chico("chico2", 123, false);
        n.agregarChico(c);
        
        // agrego a exploradores
        c = new Chico("chico3", 123, false);
        e.agregarChico(c);
        c = new Chico("chico4", 123, true);
        e.agregarChico(c);
        c = new Chico("chico5", 123, false);
        e.agregarChico(c);
        
        // representacion string
        System.out.println(n.representacionDeGrupos());
        System.out.println(e.representacionDeGrupos());
        
        // es rentable
        System.out.println("Nadadores es rentable? " + n.esRentable());
        System.out.println("Exploradores es rentable? " + e.esRentable());
    }
    
}
