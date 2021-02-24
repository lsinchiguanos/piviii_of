/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Torta;

import conexion.Conexion;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author David
 */
@WebServlet(name = "graficoTorta", urlPatterns = {"/graficoTorta"})
public class graficoTorta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("image/PNG");
        OutputStream out = response.getOutputStream();

        try {
            Conexion conec = new Conexion();
            Connection con = conec.getConecction();

            ResultSet rs = null;
            PreparedStatement ps = null;

            int inf = 0;
            int ni = 0;
            int ado = 0;
            int ju = 0;
            int ma = 0;
            int adul = 0;
            int vej = 0;
            String accion;
            accion = (String) request.getSession().getAttribute("nombre");
            try {
                ps = con.prepareStatement("SELECT COUNT(re.dia_duracion_aviso),\n"
                        + "CASE\n"
                        + "WHEN re.dia_duracion_aviso BETWEEN 0 AND 1 THEN 'MUY BUENO'\n"
                        + "WHEN re.dia_duracion_aviso BETWEEN 1 AND 3 THEN 'BUENO'\n"
                        + "WHEN re.dia_duracion_aviso BETWEEN 3 AND 6 THEN 'REGULAR'\n"
                        + "WHEN re.dia_duracion_aviso BETWEEN 6 AND 10 THEN 'MUY REGULAR'\n"
                        + "WHEN re.dia_duracion_aviso BETWEEN 10 AND 30 THEN 'MALA'\n"
                        + "WHEN re.dia_duracion_aviso BETWEEN 30 AND 60 THEN 'MUY MALA'\n"
                        + "ELSE 'Ninguno'\n"
                        + "END AS Etapas\n"
                        + "FROM recordatorio re inner join usuario u on re.id_usuario_creador = u.id\n"
                        + "where u.username = '" + accion + "'\n"
                        + "GROUP BY Etapas");
                rs = ps.executeQuery();

                DefaultPieDataset data = new DefaultPieDataset();
                while (rs.next()) {
                    data.setValue(rs.getString(2) + ": " + String.valueOf(rs.getInt(1)), rs.getInt(1));
                }

                JFreeChart cha = ChartFactory.createPieChart3D("Total general", data, true, true, true);

                int ancho = 750;
                int alto = 600;

                final PiePlot3D plot = (PiePlot3D) cha.getPlot();
                plot.setStartAngle(270);
                plot.setForegroundAlpha(0.80f);
                plot.setInteriorGap(0.03);

                ChartUtilities.writeChartAsPNG(out, cha, ancho, alto);

                ps.close();
                rs.close();
                conec.isConected();

            } catch (Exception ex) {
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
