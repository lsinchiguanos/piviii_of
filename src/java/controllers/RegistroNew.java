/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayra
 */
public class RegistroNew extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
          UserController datos = new UserController();
        String Nombres, Apellidos, Cédula, FechadeNacimiento,Correoelectronico,Celular,Direccion,Contrasena, Rol,Estado,FechadeCreacion,FechaModificacion;
        Nombres = request.getParameter("Nombres");
        Apellidos = request.getParameter("Apellidos");
        Cédula = request.getParameter("Cédula");
        FechadeNacimiento = request.getParameter("FechadeNacimiento");
        Correoelectronico = request.getParameter("Correoelectrónico");
        Celular = request.getParameter("Celular");
        Direccion = request.getParameter("Dirección");
        Contrasena = request.getParameter("Contrasena");
        Rol = request.getParameter("Rol");
        Estado = request.getParameter("Estado");
        FechadeCreacion = request.getParameter("FechadeCreación");
        FechaModificacion = request.getParameter("FechadeCreación");
        HttpSession sesion = request.getSession(true);
            out.println("<h1>Servlet RegistroNew at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
