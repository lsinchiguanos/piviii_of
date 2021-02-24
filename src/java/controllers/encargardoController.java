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
public class encargardoController extends Conexion{
    
    public boolean newEncargado(int idadulto, int id, String parentesco, String direcciontrabajo, String telefonotrabajo, String extensiontrabajo) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean band = false;
        try {
            String sql = "INSERT INTO public.encargado(id_adulto_mayor, id_usuario, parentesco, direccion_trabajo, telefono_trabajo, extensionc)";
            sql = sql.concat("VALUES (" + idadulto + "," + id + ",'" + parentesco + "','" + direcciontrabajo + "','" + telefonotrabajo + "','" + extensiontrabajo + "')");
            pst = getConecction().prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                band = true;
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
        return band;
    }
}