/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 *
 * @author Mayra
 */
public class ValidarCedula {

    private String cedula;

    public ValidarCedula(String cedula) {
        this.cedula = cedula;
    }

    public ValidarCedula() {
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCedula() {
        return cedula;
    }
}
