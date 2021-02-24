/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 *
 * @author sinchijr
 */
public class eventos {
    private int id;
    private int usercreated;
    private int userdestined;
    private String title;
    private String start;
    private String end;
    private String horaaviso;
    private int diaduracion;
    private int horafrecuente;
    private int preaviso;
    private int posaviso;
    private String description;
    private String color;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsercreated() {
        return usercreated;
    }

    public void setUsercreated(int usercreated) {
        this.usercreated = usercreated;
    }

    public int getUserdestined() {
        return userdestined;
    }

    public void setUserdestined(int userdestined) {
        this.userdestined = userdestined;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getHoraaviso() {
        return horaaviso;
    }

    public void setHoraaviso(String horaaviso) {
        this.horaaviso = horaaviso;
    }

    public int getDiaduracion() {
        return diaduracion;
    }

    public void setDiaduracion(int diaduracion) {
        this.diaduracion = diaduracion;
    }

    public int getHorafrecuente() {
        return horafrecuente;
    }

    public void setHorafrecuente(int horafrecuente) {
        this.horafrecuente = horafrecuente;
    }

    public int getPreaviso() {
        return preaviso;
    }

    public void setPreaviso(int preaviso) {
        this.preaviso = preaviso;
    }

    public int getPosaviso() {
        return posaviso;
    }

    public void setPosaviso(int posaviso) {
        this.posaviso = posaviso;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}