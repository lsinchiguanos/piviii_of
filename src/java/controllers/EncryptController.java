package controllers;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import static org.apache.commons.codec.binary.Base64.decodeBase64;
import static org.apache.commons.codec.binary.Base64.encodeBase64;

public class EncryptController {

    // Definición del tipo de algoritmo a utilizar (AES, DES, RSA)
    public static final String ALG = "AES";
    // Definición del modo de cifrado a utilizar
    public static final String CI = "AES/CBC/PKCS5Padding";

    /**
     * Función de tipo String que recibe una llave (key), un vector de
     * inicialización (iv) y el texto que se desea cifrar
     *
     * @param key la llave en tipo String a utilizar
     * @param iv el vector de inicialización a utilizar
     * @param text el texto sin cifrar a encriptar
     * @return el texto cifrado en modo String
     * @throws Exception puede devolver excepciones de los siguientes tipos:
     * NoSuchAlgorithmException, InvalidKeyException,
     * InvalidAlgorithmParameterException, IllegalBlockSizeException,
     * BadPaddingException, NoSuchPaddingException
     */
    public static String encrypt(String key, String iv, String text) throws Exception {
        Cipher cipher = Cipher.getInstance(CI);
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), ALG);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, ivParameterSpec);
        byte[] encrypted = cipher.doFinal(text.getBytes());
        return new String(encodeBase64(encrypted));
    }

    /**
     * Función de tipo String que recibe una llave (key), un vector de
     * inicialización (iv) y el texto que se desea descifrar
     *
     * @param key la llave en tipo String a utilizar
     * @param iv el vector de inicialización a utilizar
     * @param encrypted el texto cifrado en modo String
     * @return el texto desencriptado en modo String
     * @throws Exception puede devolver excepciones de los siguientes tipos:
     * NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException,
     * InvalidAlgorithmParameterException, IllegalBlockSizeException
     */
    public static String decrypt(String key, String iv, String encrypted) throws Exception {
        Cipher cipher = Cipher.getInstance(CI);
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), ALG);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
        byte[] enc = decodeBase64(encrypted);
        cipher.init(Cipher.DECRYPT_MODE, skeySpec, ivParameterSpec);
        byte[] decrypted = cipher.doFinal(enc);
        return new String(decrypted);
    }

}
