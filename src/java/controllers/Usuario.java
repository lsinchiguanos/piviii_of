/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;
import conexion.Conexion;
import entidades.ValidarCedula;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
/**
 *
 * @author Mayra
 */
public class Usuario {

    public boolean verificarUsuario(String usuario, String campo) {
        String sql = "Select *from public.user where  " + campo + "= '" + usuario + "' ;";
        //PreparedStatement pst = null;
        //ResultSet rs = null;
        boolean band = false;
        try {
            Conexion con = new Conexion();
            PreparedStatement ps;
            Statement smt;
            ResultSet rs;
            smt = con.getConecction().createStatement();
            rs = smt.executeQuery(sql);
            if (rs.next()) {
                band = true;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return band;
    }
}
