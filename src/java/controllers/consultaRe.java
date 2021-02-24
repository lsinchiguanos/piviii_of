/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import conexion.Conexion;
import entidades.adultoMayor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sinchijr
 */
public class consultaRe extends Conexion {

    public String listDestinario(int id) {
        String resultado = "";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sentencia = "SELECT re.titulo \n"
                    + "	FROM public.recordatorio re\n"
                    + "	WHERE re.id_usuario_creador = " + id + " AND\n"
                    + "	re.estado LIKE 'Activo' AND\n"
                    + "	extract(hour from((re.fecha_recordar::timestamp)-(now()::timestamp))::interval) <= re.hora_frecuente_aviso AND\n"
                    + "	extract(hour from((re.fecha_recordar::timestamp)-(now()::timestamp))::interval) >= 0 ORDER BY re.id ASC LIMIT 1 ";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            while (rs.next()) {
                resultado = rs.getString("titulo");
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

    public String actualizar(int id) {
        String resultado = "";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sentencia = "UPDATE public.recordatorio\n"
                    + "SET estado = 'Cumplida'\n"
                    + "	FROM (SELECT re.id, re.titulo\n"
                    + "		FROM public.recordatorio re\n"
                    + "			WHERE re.id_usuario_creador = " + id + " AND\n"
                    + "				  re.estado LIKE 'Activo' AND\n"
                    + "				  extract(hour from((re.fecha_recordar::timestamp)-(now()::timestamp))::interval) <= re.hora_frecuente_aviso AND\n"
                    + "				  extract(hour from((re.fecha_recordar::timestamp)-(now()::timestamp))::interval) >= 0\n"
                    + "					ORDER BY re.id ASC LIMIT 1 ) AS subquery\n"
                    + "			WHERE public.recordatorio.id = subquery.id;";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            while (rs.next()) {
                resultado = rs.getString("titulo");
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
