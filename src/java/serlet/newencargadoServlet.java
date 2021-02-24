/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serlet;

import controllers.adultoController;
import controllers.encargardoController;
import controllers.recordatorioController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sinchijr
 */
@WebServlet(name = "newencargadoServlet", urlPatterns = {"/newencargadoServlet"})
public class newencargadoServlet extends HttpServlet {

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
        int idadulto = Integer.valueOf(request.getParameter("idadulto"));
        String parentesco = request.getParameter("parentesco");
        String direcciontrabajo = request.getParameter("direcciontrabajo");
        String telefonotrabajo = request.getParameter("telefonotrabajo");
        String extensiontrabajo = request.getParameter("extensiontrabajo");
        /*int userCreador, int userReceptor, String titulo, String fechaRe, String fechaLim, String horaR, int dia, int horaF, int timepoPre, int tiempoPos, String Color*/
        boolean r = false;
        switch (accion) {
            case "agregar":
                r = new encargardoController().newEncargado(idadulto, id, parentesco, direcciontrabajo, telefonotrabajo, extensiontrabajo);
                break;
            case "eliminar":
                r = new encargardoController().newEncargado(idadulto, id, parentesco, direcciontrabajo, telefonotrabajo, extensiontrabajo);
                break;
            case "actualizar":
                r = new encargardoController().newEncargado(idadulto, id, parentesco, direcciontrabajo, telefonotrabajo, extensiontrabajo);
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
