package controllers;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class UserController extends Conexion {

    public static final String KEY = "92AE31A79FEEB2A3";
    public static final String IV = "0123456789ABCDEF";

    public String sesionLogs(int id, String ip) {
        Calendar calendario = new GregorianCalendar();
        String resultado = "";
        int hora, minuto, segundo;
        hora = calendario.get(Calendar.HOUR_OF_DAY);
        minuto = calendario.get(Calendar.MINUTE);
        segundo = calendario.get(Calendar.SECOND);
        String horas = String.valueOf(hora) + ":" + String.valueOf(minuto) + ":" + String.valueOf(segundo);
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//          clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "INSERT INTO public.sesiones_log(\n"
                    + "		id_usuario, fecha, hora, direccion_ip)\n"
                    + "	VALUES (" + id + ", current_date, '" + horas + "', '" + ip + "');";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            if (rs.next()) {
                resultado = rs.getString(1);
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
        return resultado;
    }

    public ArrayList<String> login(String clave, String usuario) {
        ArrayList<String> respuesta = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            clave = EncryptController.encrypt(KEY, IV, clave);
            String sentencia = "SELECT username, contrasenia, id,rol  FROM usuario  WHERE username='" + usuario + "' and contrasenia='" + clave + "';";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            if (rs.next()) {
                respuesta.add(rs.getString(1));
                respuesta.add(rs.getString(2));
                respuesta.add(rs.getString(3));
                respuesta.add(rs.getString(4));
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
        return respuesta;
    }

    public boolean registro(String cedula, String nombres, String apellidos, String fecha_nacimiento, String correo_electronico, String numero_celular, String direccion_vivienda, String username, String contrasenia, String rol) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean band = false;
        try {
            String codigo = EncryptController.encrypt(KEY, IV, contrasenia);
            String sql = "INSERT INTO public.usuario(cedula, nombres, apellidos, fecha_nacimiento, correo_electronico, numero_celular, direccion_vivienda, username, contrasenia, rol) VALUES ('" + cedula + "','" + nombres + "', '" + apellidos + "', '" + fecha_nacimiento + "', '" + correo_electronico + "', '" + numero_celular + "', '" + direccion_vivienda + "', '" + username + "', '" + codigo + "', '" + rol + "')";
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

    public int obtenerUltimoRegistro() {
        PreparedStatement pst = null;
        ResultSet rs = null;
        int band = 0;
        try {
            //codigo = EncryptController.encrypt(KEY, IV, codigo);
            String sql = "SELECT usuario.id FROM public.usuario ORDER BY usuario.id DESC LIMIT 1";
            pst = getConecction().prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                band = rs.getInt(1);
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

    public boolean modificarClave(String usuario, String clave) {
        PreparedStatement pst = null;
        boolean band = false;
        try {
            clave = EncryptController.encrypt(KEY, IV, clave);
            String sql = "UPDATE persona ";
            sql = sql.concat("SET  persona_clave='" + clave + "' ");
            sql = sql.concat("WHERE persona_usuario='" + usuario + "';");
            pst = getConecction().prepareStatement(sql);
            int val = pst.executeUpdate();
            if (val == 1) {
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
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
        return band;
    }

    public boolean verificarUsuario(String usuario, String campo) {
        String sql = "SELECT * FROM usuario where  " + campo + "= '" + usuario + "' ;";
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean band = false;
        try {
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

    public String devolverCorreo(String usuario) {
        String respuesta = "";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sentencia = "SELECT persona_email FROM persona  WHERE persona_usuario='" + usuario + "';";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            if (rs.next()) {
                respuesta = rs.getString(1);
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

    public String devolverUsuario(String correo) {
        String sentencia = "SELECT persona_usuario FROM persona  WHERE  persona_email='" + correo + "';";
        String respuesta = "";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            if (rs.next()) {
                respuesta = rs.getString(1);
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

    public String extraerDato(String id) {
        String sentencia = "select clave_respaldo from usuarios where cedula='" + id + "'";
        String respuesta = "";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            if (rs.next()) {
                respuesta = rs.getString("clave_respaldo");
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

    public boolean verificarClave(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean est = false;
        try {
            clave = EncryptController.encrypt(KEY, IV, clave);
            String sql = "select * from persona where persona_usuario='" + usuario + "' and persona_clave= '" + clave + "'";
            pst = getConecction().prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                est = true;
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
        return est;
    }

    public ArrayList<String> Verificarcodigo(String codigo, String usuario) {
        ArrayList<String> respuesta = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            codigo = EncryptController.encrypt(KEY, IV, codigo);
            String sentencia = "SELECT persona_id,persona_nombre||' '||persona_apellido,persona_usuario FROM persona  WHERE persona_usuario='" + usuario + "' and persona_codigo='" + codigo + "';";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            if (rs.next()) {
                respuesta.add(rs.getString(1));
                respuesta.add(rs.getString(2));
                respuesta.add(rs.getString(3));
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
        return respuesta;
    }

    public ArrayList<String> ExtaredatosUsuarioSolo(String usuario) {
        ArrayList<String> respuesta = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

            String sentencia = "SELECT persona_id,persona_nombre||' '||persona_apellido,persona_usuario FROM persona  WHERE persona_usuario='" + usuario + "';";
            pst = getConecction().prepareStatement(sentencia);
            rs = pst.executeQuery();
            if (rs.next()) {
                respuesta.add(rs.getString(1));
                respuesta.add(rs.getString(2));
                respuesta.add(rs.getString(3));
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
        return respuesta;
    }

    public boolean modificarCodigo(String usuario, String codigo) {
        PreparedStatement pst = null;
        boolean band = false;
        try {
            codigo = EncryptController.encrypt(KEY, IV, codigo);
            String sql = "UPDATE persona ";
            sql = sql.concat("SET  persona_codigo='" + codigo + "' ");
            sql = sql.concat("WHERE persona_usuario='" + usuario + "';");
            pst = getConecction().prepareStatement(sql);
            int val = pst.executeUpdate();
            if (val == 1) {
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
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
        return band;
    }

    public boolean editarUsuario(int id, String apellidos, String nombres, String cedula, String Correoelectronico, String Celular, String Usuario, String Dirección) {
        PreparedStatement pst = null;
        boolean band = false;
        try {
            String sql = "update public.usuario set fecha_modificacion = now(), nombres= '" + nombres + "',apellidos='" + apellidos + "',cedula='" + cedula + "',correo_electronico='" + Correoelectronico + "',numero_celular='" + Celular + "',username='" + Usuario + "',direccion_vivienda='" + Dirección + "' where id=" + id;
            pst = getConecction().prepareStatement(sql);
            int val = pst.executeUpdate();
            if (val == 1) {
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
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
        return band;
    }
}
