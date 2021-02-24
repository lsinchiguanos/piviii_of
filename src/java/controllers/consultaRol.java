/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sinchijr
 */
public class consultaRol extends Conexion {

    public String listDestinario(String user) {
        String resultado = "";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//          clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "SELECT us.rol FROM public.usuario us WHERE us.username = '" + user + "';";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            while (rs.next()) {
                resultado = rs.getString("rol");
                //System.out.print(rs.getString("nombre"));
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            try {
                if (isConected()) {
                    getConecction().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
        return resultado;
    }
}
