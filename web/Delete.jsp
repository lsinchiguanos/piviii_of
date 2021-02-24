<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //CONECTANOD A LA BASE DE     
            try {
                Conexion con = new Conexion();
                //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
                PreparedStatement ps;
                int id = Integer.parseInt(request.getParameter("id"));
                ps = con.getConecction().prepareStatement("delete from public.usuario where id=" + id);
                ps.executeUpdate();
                response.sendRedirect("ListarUsuarios.jsp");
            } catch (Exception ex) {

            }
        %>
    </body>
</html>
