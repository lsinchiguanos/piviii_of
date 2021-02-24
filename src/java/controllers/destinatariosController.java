/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entidades.destino;
import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sinchijr
 */
public class destinatariosController extends Conexion {

    public List<destino> listDestinario(int id) {
        List<destino> destinos = new ArrayList<destino>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//          clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "SELECT ad.id_usuario, concat(ad.apellidos, ' ', ad.nombres) AS apellidos\n"
                    + "	FROM public.viewadultomayor ad, public.viewencargados encs, public.encargado enc\n"
                    + "		WHERE ad.id = enc.id_adulto_mayor and encs.id = enc.id_usuario and encs.id = " + id + "\n"
                    + "UNION\n"
                    + "SELECT usuario.id, concat(usuario.apellidos, ' ', usuario.nombres) AS apellidos\n"
                    + "	FROM public.usuario\n"
                    + "		WHERE usuario.estado = 'A' AND usuario.rol = 'CP' AND id = " + id + ";";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            while (rs.next()) {
                destino event = new destino();
                event.setId(Integer.valueOf(rs.getString("id_usuario")));
                event.setDestinatario(rs.getString("apellidos"));
                destinos.add(event);
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
        return destinos;
    }

}
