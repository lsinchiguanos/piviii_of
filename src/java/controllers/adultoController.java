/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import conexion.Conexion;
import entidades.adultoMayor;

/**
 *
 * @author Kike
 */
public class adultoController extends Conexion {

    public List<adultoMayor> listDestinario(int usuario) {
        List<adultoMayor> destinos = new ArrayList<adultoMayor>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//          clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "select distinct c.id as id, c.nombread as nombre from \n"
                    + "(select re.id_usuario_receptor as id, us.apellidos || ' '|| us.nombres as NombreCuidador, \n"
                    + " (select apellidos || ' '|| nombres as NombreAD from usuario \n"
                    + "  where id=re.id_usuario_receptor), re.titulo as titulo,\n"
                    + " re.descripcion as descripcion,us.fecha_nacimiento as FechNacAD,\n"
                    + " us.correo_electronico as Correo, us.numero_celular as Celular,\n"
                    + " us.direccion_vivienda as vivienda,re.fecha_recordar as Frecor, \n"
                    + " re.hora_recordatorio as Frecordatorio from recordatorio re \n"
                    + " inner join usuario us on re.id_usuario_creador=us.id\n"
                    + "where us.id = '" + usuario + "') c";
            pst = getConecction().prepareStatement(sentencia);
            //System.out.println("///////");
            //System.out.println(usuario);
            rs = pst.executeQuery();
            while (rs.next()) {
                adultoMayor event = new adultoMayor();
                event.setId(Integer.valueOf(rs.getString("id")));
                event.setNombre(rs.getString("nombre"));
                destinos.add(event);
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
        return destinos;
    }

    public List<adultoMayor> listAdultoMayor(int id) {
        List<adultoMayor> destinos = new ArrayList<adultoMayor>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//          clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "SELECT distinct us.idadulto, us.idusuario, us.apellidos\n"
                    + "	FROM public.viewadultosusers us\n"
                    + "    WHERE NOT EXISTS (Select distinct enc.idadultomayor from public.viewAdultosEncargado enc where enc.idencargado = " + id + " AND us.idadulto = enc.idadultomayor)";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            while (rs.next()) {
                adultoMayor event = new adultoMayor();
                event.setId(Integer.valueOf(rs.getString("idadulto")));
                event.setNombre(rs.getString("apellidos"));
                destinos.add(event);
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
        return destinos;
    }

    public boolean registro(int id, String telefonoemergencia) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean band = false;
        try {
            //codigo = EncryptController.encrypt(KEY, IV, codigo);
            String sql = "INSERT INTO public.adulto_mayor(id_usuario, telefono_emergencia)";
            sql = sql.concat("VALUES (" + id + ", '" + telefonoemergencia + "')");
            pst = getConecction().prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                band = true;
            }
        } catch (Exception ex) {
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
