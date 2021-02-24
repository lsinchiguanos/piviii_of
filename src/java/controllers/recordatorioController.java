/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entidades.eventos;
import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author sinchijr
 */
public class recordatorioController extends Conexion {

    public ArrayList<eventos> consultaEventosAdulto(String id) {
        ArrayList<eventos> respuesta = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//          clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "SELECT recordatorio.id, recordatorio.id_usuario_creador, recordatorio.id_usuario_receptor, recordatorio.titulo, recordatorio.fecha_recordar, recordatorio.fecha_limite, recordatorio.hora_recordatorio, recordatorio.dia_duracion_aviso, recordatorio.hora_frecuente_aviso, recordatorio.tiempo_pre_notificacion, recordatorio.tiempo_pos_aviso, recordatorio.descripcion, recordatorio.color\n"
                    + "	FROM public.recordatorio, public.usuario us\n"
                    + "	WHERE recordatorio.estado = 'Activo' AND\n"
                    + "		  recordatorio.id_usuario_receptor = us.id AND\n"
                    + "		  us.username = '" + id + "';";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            while (rs.next()) {
                eventos event = new eventos();
                event.setId(Integer.valueOf(rs.getString("id")));
                event.setUsercreated(Integer.valueOf(rs.getString("id_usuario_creador")));
                event.setUserdestined(Integer.valueOf(rs.getString("id_usuario_receptor")));
                event.setTitle(rs.getString("titulo"));
                event.setStart(rs.getString("fecha_recordar"));
                event.setEnd(rs.getString("fecha_limite"));
                event.setDiaduracion(Integer.valueOf(rs.getString("dia_duracion_aviso")));
                event.setHorafrecuente(Integer.valueOf(rs.getString("hora_frecuente_aviso")));
                event.setPreaviso(Integer.valueOf(rs.getString("tiempo_pre_notificacion")));
                event.setPosaviso(Integer.valueOf(rs.getString("tiempo_pos_aviso")));
                event.setDescription(rs.getString("descripcion"));
                event.setColor(rs.getString("color"));
                event.setHoraaviso(rs.getString("hora_recordatorio"));
                respuesta.add(event);
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
        return respuesta;
    }

    public ArrayList<eventos> consultaEventosEncargado(String id) {
        ArrayList<eventos> respuesta = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//          clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "SELECT recordatorio.id, recordatorio.id_usuario_creador, recordatorio.id_usuario_receptor, recordatorio.titulo, recordatorio.fecha_recordar, recordatorio.fecha_limite, recordatorio.hora_recordatorio, recordatorio.dia_duracion_aviso, recordatorio.hora_frecuente_aviso, recordatorio.tiempo_pre_notificacion, recordatorio.tiempo_pos_aviso, recordatorio.descripcion, recordatorio.color\n"
                    + "	FROM public.recordatorio, public.usuario us\n"
                    + "	WHERE recordatorio.estado = 'Activo' AND\n"
                    + "		  recordatorio.id_usuario_creador = us.id AND\n"
                    + "		  us.username = '" + id + "';";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            while (rs.next()) {
                eventos event = new eventos();
                event.setId(Integer.valueOf(rs.getString("id")));
                event.setUsercreated(Integer.valueOf(rs.getString("id_usuario_creador")));
                event.setUserdestined(Integer.valueOf(rs.getString("id_usuario_receptor")));
                event.setTitle(rs.getString("titulo"));
                event.setStart(rs.getString("fecha_recordar"));
                event.setEnd(rs.getString("fecha_limite"));
                event.setDiaduracion(Integer.valueOf(rs.getString("dia_duracion_aviso")));
                event.setHorafrecuente(Integer.valueOf(rs.getString("hora_frecuente_aviso")));
                event.setPreaviso(Integer.valueOf(rs.getString("tiempo_pre_notificacion")));
                event.setPosaviso(Integer.valueOf(rs.getString("tiempo_pos_aviso")));
                event.setDescription(rs.getString("descripcion"));
                event.setColor(rs.getString("color"));
                event.setHoraaviso(rs.getString("hora_recordatorio"));
                respuesta.add(event);
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
        return respuesta;
    }

    public boolean updateEvent(int id, int userReceptor, String titulo, String fechaRe, String fechaLim, String horaR, int dia, int horaF, int timepoPre, int tiempoPos, String descipcion, String Color) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean band = false;
        try {
            String sql = "UPDATE public.recordatorio\n"
                    + "	SET id_usuario_receptor= " + userReceptor + ", titulo='" + titulo + "', fecha_recordar='" + fechaRe + "', fecha_limite='" + fechaLim + "', hora_recordatorio='" + horaR + "', dia_duracion_aviso=" + dia + ", hora_frecuente_aviso=" + horaF + ", tiempo_pre_notificacion=" + timepoPre + ", tiempo_pos_aviso=" + tiempoPos + ", descripcion='" + descipcion + "', color='" + Color + "', fecha_modificacion=now()\n"
                    + "	WHERE id=" + id + ";";
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

    public boolean deleteEvent(int id) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean band = false;
        try {
            String sql = "DELETE FROM public.recordatorio WHERE id = " + id + ";";
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

    public boolean newEvent(int userCreador, int userReceptor, String titulo, String fechaRe, String fechaLim, String horaR, int dia, int horaF, int timepoPre, int tiempoPos, String descipcion, String Color) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean band = false;
        try {
            String sql = "INSERT INTO public.recordatorio\n"
                    + "(id_usuario_creador,\n"
                    + "id_usuario_receptor,\n"
                    + "titulo,\n"
                    + "fecha_recordar,\n"
                    + "fecha_limite,\n"
                    + "hora_recordatorio,\n"
                    + "dia_duracion_aviso,\n"
                    + "hora_frecuente_aviso,\n"
                    + "tiempo_pre_notificacion,\n"
                    + "tiempo_pos_aviso,\n"
                    + "descripcion,\n"
                    + "color)";
            sql = sql.concat("VALUES (" + userCreador + "," + userReceptor + ",'" + titulo + "','" + fechaRe + "','" + fechaLim + "'");
            sql = sql.concat(",'" + horaR + "', " + dia + ", " + horaF + ", " + timepoPre + ", " + tiempoPos + ",'" + descipcion + "','" + Color + "')");
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

    public ResultSet listUsuario(int usuario) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sentencia = "SELECT ad.id_usuario, ad.id, ad.cedula, concat(ad.apellidos, ' ', ad.nombres) AS apellidos, enc.parentesco, enc.direccion_trabajo, enc.telefono_trabajo, enc.extensionc\n"
                    + "	FROM public.viewadultomayor ad, public.viewencargados encs, public.encargado enc\n"
                    + "		WHERE ad.id = enc.id_adulto_mayor and encs.id = enc.id_usuario and encs.id =" + usuario + ";";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
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
        return rs;
    }

    private String fechaModificacion() {
        String fechaM = "";
        Calendar fecha = new GregorianCalendar();
        int anio = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int minuto = fecha.get(Calendar.MINUTE);
        int segundo = fecha.get(Calendar.SECOND);
        fechaM = String.valueOf(anio) + "-" + String.valueOf(mes) + "-" + String.valueOf(dia) + " " + String.valueOf(hora) + ":" + String.valueOf(minuto) + ":" + String.valueOf(segundo);
        return fechaM;
    }

}
