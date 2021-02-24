/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serlet;

import controllers.UserController;
import controllers.adultoController;
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
@WebServlet(name = "usuarioServlet", urlPatterns = {"/usuarioServlet"})
public class usuarioServlet extends HttpServlet {

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
        boolean r;
        int ida = 0;
        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        String cedula = request.getParameter("cedula");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String fecha_nacimiento = request.getParameter("fecha_nacimiento");
        String correo_electronico = request.getParameter("correo_electronico");
        String numero_celular = request.getParameter("numero_celular");
        String direccion_vivienda = request.getParameter("direccion_vivienda");
        String username = request.getParameter("username");
        String contrasenia = request.getParameter("contrasenia");
        String rol = request.getParameter("rol");
        String telefonoemergencia = request.getParameter("telefonoemergencia");
        switch(accion) {
            case "agregar":
                r = new UserController().registro(cedula, nombres, apellidos, fecha_nacimiento, correo_electronico, numero_celular, direccion_vivienda, username, contrasenia, rol);
                if (rol.equals("AD")) {
                    ida = new UserController().obtenerUltimoRegistro();
                    r = new adultoController().registro(ida, telefonoemergencia);
                }
                break;
        }
        out.print(out);
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
