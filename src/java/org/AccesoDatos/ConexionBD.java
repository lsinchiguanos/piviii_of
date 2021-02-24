/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.AccesoDatos;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import org.AccesoDatos.encrypt;

/**
 *
 * @author WILMER ALMEIDA
 */
public class ConexionBD {

    private Connection con;
    public Statement st;
    public ResultSet rs;
    public PreparedStatement ps;
    public PreparedStatement ps2;
    private String tabla;
    private String coordinador;
    private String malla;
    private String graduado;
    private Image image;

    public Image getImage() throws SQLException {
         ps = getConnection().prepareStatement("select foto, nombre from persona where codigo = 1");
        ImageIcon foto;
        InputStream is;
        String nombre;
        try{
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                is = rs.getBinaryStream(1);
                nombre = rs.getString(2);
                
                BufferedImage bi = ImageIO.read(is);
                foto = new ImageIcon(bi);
                
                Image img = foto.getImage();
                Image newimg = img.getScaledInstance(140, 170, java.awt.Image.SCALE_SMOOTH);
                
                ImageIcon newicon = new ImageIcon(newimg);
                
                image=newicon.getImage();
            }
        }catch(Exception ex){
        }
        
        return image;
    }

    
    
//    public ResultSet Usuario() throws SQLException {
//       byte a;
//        Statement st = con.createStatement();
//        ResultSet rs = null;
//            try {
//                String cadSQL = "select foto, nombre from persona where codigo = 1";
//                rs = st.executeQuery(cadSQL);
//                if(rs.next()){
//                a=rs.getBytes("foto");
//                }
//            } catch (SQLException e) {
//                System.out.print(e);
//            } finally {
//                //conex.close();
//            }
//
//                return rs;
//    }
    
    

    public String getMalla() {
        AbriConexion();
        String respuesta = "";
        String sentencia = "";
        try {
            ps = getConnection().prepareStatement("Select MA.codmalla from coordinadores Co\n" +
"inner join malla MA on MA.codcarrera = Co.codcarrera\n" +
"inner join usuarios U on U.codpersona = Co.codpersona \n" +
"	where nombreusuario = '"+coordinador+"' ");
            rs = ps.executeQuery();
          while (rs.next()) {
                malla  = rs.getString(1);
          }
            
            CerrarConexion();
        } catch (Exception e) {
            
        }
        return malla;
    }
    

    public String getCoordinador() {
        String respuesta = "";
        String sentencia = "";
        try {
           
            ps = getConnection().prepareStatement("SELECT codcordinador \n" +
"	FROM coordinadores Co inner join usuarios U on U.codpersona = Co.codpersona\n" +
"	where nombreusuario = '"+coordinador+"' ");
            
            rs = ps.executeQuery();
          while (rs.next()) {
                respuesta  = rs.getString(1);
          }
            
            CerrarConexion();
        } catch (Exception e) {
            
        }
        return respuesta;
    }

    public void setCoordinador(String coordinador) {
        this.coordinador = coordinador;
    }
    

    public String getTabla() {
         AbriConexion();
        String respuesta = "";
        String sentencia = "";
        try { 
            ps = getConnection().prepareStatement("Select codcarrera from usuarios U\n" +
" inner join coordinadores Co on U.codpersona = Co.codpersona\n" +
" where nombreusuario = '"+tabla+"'");

            rs = ps.executeQuery();
          while (rs.next()) {
                respuesta  = rs.getString(1);
          }
            
            CerrarConexion();
        } catch (Exception e) {
            
        }
        return respuesta;
    }

    public void setTabla(String tabla) {
        this.tabla = tabla;
    }
    

    public ConexionBD() {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SGG", "postgres", "2019");
            st = con.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.printf(e.getMessage());
        }
    }

    public ConexionBD(String url, String nombre, String clave) {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, nombre, clave);
            st = con.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.printf(e.getMessage());
        }
    }

    public void AbriConexion() {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SGG", "postgres", "2019");
            st = con.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.printf(e.getMessage());
        }
    }

    public void insertandoSemanas(String descripcion) throws SQLException {
        String sql = descripcion;
        Statement consulta = null;
        
        consulta = (Statement) con.createStatement();
        consulta.executeUpdate(sql);
    }
     public void insertandoSemanas2(String descripcion) throws SQLException {
        String sql = descripcion;
        Statement consulta = null;
        
        consulta = (Statement) con.createStatement();
        consulta.executeQuery(sql);
    }
    
    public Statement getSt() {
        return st;
    }

    public void setSt(Statement st) {
        this.st = st;
    }

    public Connection getConnection() {
        return con;
    }

    public void desconectar() {
        con = null;
    }

    public void GuardarClave(String cuerpo, String user) throws SQLException, Exception {
        AbriConexion();
        String sql = "";
        java.sql.Statement consulta = null;
         encrypt en = new  encrypt();
            en.setEncryptado(cuerpo);
        sql += "update usuarios set clave= '" + en.encryptado + "' , clave_respaldo='" + en.encryptado + "' where correo='" + user + "'";
        consulta = (java.sql.Statement) con.createStatement();
        consulta.executeUpdate(sql);
        con.close();
    }

    public void CerrarConexion() throws SQLException {
        con.close();
        con = null;

    }

    public String ExtraerDato(String id) {
        AbriConexion();
        String respuesta = "";
        String sentencia = "";
        try {
            ps = con.prepareStatement("select clave_respaldo from usuarios where cedula='" + id + "'");
            rs = ps.executeQuery();
            while (rs.next()) {
                respuesta = rs.getString("clave_respaldo");
            }
            CerrarConexion();
        } catch (Exception e) {
        }
        return respuesta;
    }
    
      public String[] extraer(String clave,String usuario) throws SQLException, Exception {
        String respuesta[] = new String[3];
        String sentencia = "";
     
            encrypt en = new  encrypt();
            en.setEncryptado(clave);
            sentencia="SELECT codrol,nombre||' '|| apellido as nombres,codPersona,codPersona from usuarios WHERE nombreusuario='"+usuario+"' and clave='"+en.encryptado+"';";
            ps2 = con.prepareStatement(sentencia);
            rs = ps2.executeQuery();
            int i=0;
            while (rs.next()) {
                respuesta[0] = rs.getString(1);
                respuesta[1] = rs.getString(2);
                respuesta[2] = rs.getString(3);

            }
        return respuesta;
        
        
    }
       public boolean login(String clave,String usuario) throws SQLException, Exception {
        AbriConexion();
        String respuesta[] = new String[2];
        String sentencia = "";
     
            encrypt en = new  encrypt();
            en.setEncryptado(clave);
            ps = con.prepareStatement("SELECT codrol,nombre||' '|| apellido from usuarios WHERE nombreusuario='"+usuario+"' and clave='"+en.encryptado+"';\n");
            rs = ps.executeQuery();
            int i=0;
            if (rs.next()) {

             return  true;
            }
        return false;
        
        
    }
        public boolean recuperacion(String clave,String usuario) throws SQLException, Exception {
        String respuesta[] = new String[2];
        String sentencia = "";
     
            encrypt en = new  encrypt();
            en.setEncryptado(clave);
            ps = con.prepareStatement("SELECT codrol,nombre||' '|| apellido from usuarios WHERE nombreusuario='"+usuario+"' and clave_respaldo='"+en.encryptado+"';\n");
            rs = ps.executeQuery();
            int i=0;
            if (rs.next()) {

             return  true;
            }
        return false;
        
        
    }
}
