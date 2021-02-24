package controllers;

public class Metodos {

    private String nombre = "";

    public Metodos() {
    }

    public Metodos(String nombre, String tipo) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


}
