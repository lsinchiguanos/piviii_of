package conexion;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion implements Serializable {

    private final String user = "postgres";
    private final String pass = "1234";
    private final String url = "jdbc:postgresql://localhost:5433/pi_vi2";
    private Connection conecction;
    private static final long serialVersionUID = 1L;

    public Conexion() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println(e.getMessage());
        }
    }

    public synchronized Connection getConecction() {
        try {
            if (conecction == null || conecction.isClosed()) {
                conecction = DriverManager.getConnection(url, user, pass);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return conecction;
    }

    public boolean isConected() {
        try {
            if (conecction == null) {
                return false;
            } else return !conecction.isClosed();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
