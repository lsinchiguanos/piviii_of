<%-- 
    Document   : Editar
    Created on : 02/02/2018, 03:33:51 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="Principal/css/main.css" />
        <link href="materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
        <script src="HistorialJean/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Conexion con = new Conexion();
            Statement smt;
            //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
            PreparedStatement ps;
            ResultSet rs;
            int id = Integer.parseInt(request.getParameter("id"));
            ps = con.getConecction().prepareStatement("select * from usuario where id=" + id);
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo center-align textgrueso " id="ulUserData"style="padding-top:6px; text-align:center; width:100%; font-size:20px; color:#707070" href="index.html">Modificar Usuario</a>
        </header>
        <br>
        <div class="container">
            <div class="row">
                <form class="col s12" method="post" name="formacedula">
                    <div class="input-field col s6">
                        <input id="id" type="text" readonly="" class="validate" value="<%= rs.getInt("id")%>">
                        <label for="id">Id</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="nombres" name="nombres" type="text" class="validate" value="<%= rs.getString("nombres")%>">
                        <label for="nombres">Nombres:</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="apellidos" apellidos="apellidos" type="text" class="validate" value="<%= rs.getString("apellidos")%>">
                        <label for="apellidos">Apellidos:</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="cedula" name="cedula" type="text" class="validate" maxlength="10" value="<%= rs.getString("cedula")%>">
                        <label for="cedula">Cedula:</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="correo_electronico" name="correo_electronico" type="email" class="validate" value="<%= rs.getString("correo_electronico")%>" >
                        <label for="correo_electronico">Correo electrónico:</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="celular" name="celular" type="tel" class="validate" value="<%= rs.getString("numero_celular")%>" >
                        <label for="celular">Celular:</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="direccion" name="direccion" type="text" class="validate" value="<%= rs.getString("direccion_vivienda")%>" >
                        <label for="direccion">Dirección:</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="usuario" name="usuario" type="text" class="validate" value="<%= rs.getString("username")%>" >
                        <label for="usuario">Usuario:</label>
                    </div>
                    <br>
                    <center>
                        <button onclick="actualizar()" class="waves-effect waves-light btn-large" value="Guardar">Guardar</button>
                    </center>
                </form>
            </div>
            <%}%>
        </div>
    </body>
    <script type="text/javascript">
        var newObjeto = [];
        function actualizar() {
            newObjeto = {
                id: $("#id").val(),
                nombres: $("#nombres").val(),
                apellidos: $("#apellidos").val(),
                cedula: $("#cedula").val(),
                Correoelectronico: $("#correo_electronico").val(),
                Celular: $("#celular").val(),
                Usuario: $("#usuario").val(),
                Direccion: $("#direccion").val()
            };
            $.ajax({
                type: 'POST',
                url: "actualizarUser",
                data: newObjeto,
                success: function (msg) {
                    if(msg === 'Actualizado con éxito') {
                        alert(msg);
                        location.href = "ListarUsuarios.jsp";
                    }
                },
                error: function () {
                    alert('Ocurrio un error');
                }});
            console.log(newObjeto);
        }
        ;
    </script>
    <script src="materialize/js/materialize.js" type="text/javascript"></script>
    <script src="materialize/js/materialize.min.js" type="text/javascript"></script>
</html>
<%
    String nombres, apellidos, Correoelectronico, Celular, Usuario, Dirección, cedula;
    nombres = request.getParameter("nombres");
    apellidos = request.getParameter("apellidos");
    cedula = request.getParameter("cedula");
    Correoelectronico = request.getParameter("correo_electronico");
    Celular = request.getParameter("celular");
    Usuario = request.getParameter("usuario");
    Dirección = request.getParameter("direccion");
    if (nombres != null && Correoelectronico != null && Celular != null && Usuario != null && Dirección != null && cedula != null && apellidos != null) {
        response.sendRedirect("ListarUsuarios.jsp");
    }
%>
