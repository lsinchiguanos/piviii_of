/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Random;

/**
 *
 * @author Mayra
 */
public class GenerarCodigoRandon {
       public  String random() {
        Random rnd = new Random();
        String abecedario = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String cadena = "";
        int m = 0, pos, num;
        while (m < 1) {
            pos = (int) (rnd.nextDouble() * abecedario.length() - 1 + 0);
            num = (int) (rnd.nextDouble() * 999999999 + 1000000000);
            cadena = cadena + abecedario.charAt(pos) + num;
            pos = (int) (rnd.nextDouble() * abecedario.length() - 1 + 0);
            cadena = cadena + abecedario.charAt(pos);
            m++;
        }
        return cadena;
    }
}
