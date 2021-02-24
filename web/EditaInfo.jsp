<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="EditarInfo/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Conexion con = new Conexion();
            //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
            PreparedStatement ps;
            ResultSet rs;
            String id = String.valueOf(request.getParameter("id"));
            session.getAttribute("nombre");
            ps = con.getConecction().prepareStatement("select * from usuario where username = '" + session.getAttribute("nombre") + "'" );
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                CEDULA:
                <input type="text"  name="cedula" readonly="" class="form-control" value="<%= rs.getString("cedula")%>"/>
                Nombre:
                <input type="text" name="nombre" class="form-control" value="<%= rs.getString("nombres")%>"/><br>
                Correo_Electronico:
                <input type="text" name="correo" class="form-control" value="<%= rs.getString("correo_electronico")%>"/><br>
                Celular:
                <input type="text" name="celular" class="form-control" value="<%= rs.getString("numero_celular")%>"/><br>
                Direccion:
                <input type="text" name="direccion" class="form-control" value="<%= rs.getString("direccion_vivienda")%>"/><br>
                <input type="submit" value="Modificar" class="btn btn-primary btn-lg"/>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    String  nombre,correo,celular,direccion;
    nombre = request.getParameter("nombre");
    correo = request.getParameter("correo");
    celular = request.getParameter("celular");
    direccion = request.getParameter("direccion");
    if (nombre != null) {
        ps = con.getConecction().prepareStatement("update usuario set nombres='" + nombre + "',correo_electronico ='"+correo+"',numero_celular='"+celular+"', direccion_vivienda='"+direccion+"', fecha_modificacion = now() where username = '" + session.getAttribute("nombre") + "'");
        ps.executeUpdate();
        response.sendRedirect("Principal.jsp");
    }


%>
