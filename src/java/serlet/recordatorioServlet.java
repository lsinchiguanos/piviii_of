/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.recordatorioController;

/**
 *
 * @author sinchijr
 */
@WebServlet(name = "recordatorioServlet", urlPatterns = {"/recordatorioServlet"})
public class recordatorioServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        int id = Integer.valueOf(request.getParameter("id"));
        int idUsuarioCreador = Integer.valueOf(request.getParameter("usercreated"));
        int idUsuarioReceptor = Integer.valueOf(request.getParameter("userdestined"));
        String titulo = request.getParameter("title");
        String fecha = request.getParameter("start");
        String fechafin = request.getParameter("end");
        String horaaviso = request.getParameter("horaaviso");
        horaaviso = horaaviso.substring(0, 5);
        int diasDuracion = Integer.valueOf(request.getParameter("diaduracion"));
        int horaFrecuencia = Integer.valueOf(request.getParameter("horafrecuente"));
        int preNotificacion = Integer.valueOf(request.getParameter("preaviso"));
        int postNotificacion = Integer.valueOf(request.getParameter("posaviso"));
        String descipcion = request.getParameter("description");
        String color = request.getParameter("color");
        /*int userCreador, int userReceptor, String titulo, String fechaRe, String fechaLim, String horaR, int dia, int horaF, int timepoPre, int tiempoPos, String Color*/
        boolean r = false;
        switch(accion) {
            case "agregar":
                r = new recordatorioController().newEvent(idUsuarioCreador, idUsuarioReceptor, titulo, fecha, fechafin, horaaviso, diasDuracion, horaFrecuencia, preNotificacion, postNotificacion, descipcion, color);
                break;
            case "eliminar":
                r = new recordatorioController().deleteEvent(id);
                break;
            case "actualizar":
                r = new recordatorioController().updateEvent(id, idUsuarioReceptor, titulo, fecha, fechafin, horaaviso, diasDuracion, horaFrecuencia, preNotificacion, postNotificacion, descipcion, color);
                break;
        }
        out.print(r);
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
