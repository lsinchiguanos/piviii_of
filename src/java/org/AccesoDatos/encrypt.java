/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.AccesoDatos;

import java.sql.ResultSet;
import java.sql.Statement;
import org.AccesoDatos.StringEncrypt;

/**
 *
 * @author ACER
 */
public class encrypt {
    String encryptado;
    String desencryptado;

    public String getEncryptado() {
        return encryptado;
    }

    public void setEncryptado(String encryptado) throws Exception {
         String key = "92AE31A79FEEB2A3"; //llave
 String iv = "0123456789ABCDEF"; // vector de inicialización
 

       
         
        this.encryptado = StringEncrypt.encrypt(key, iv,encryptado);

    }

    public String getDesencryptado() {
        return desencryptado;
    }

    public void setDesencryptado(String desencryptado) {
        this.desencryptado = desencryptado;
    }
    public String Encryptar (String clave) throws Exception
    {
       
        return null;
 
    }
}
