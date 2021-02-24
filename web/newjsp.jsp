<%-- 
    Document   : newjsp
    Created on : 06-feb-2021, 22:19:29
    Author     : Mayra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/>
             <link href="materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
             <script src="materialize/js/materialize.js" type="text/javascript"></script>
             <script src="materialize/js/materialize.min.js" type="text/javascript"></script>
    </head>
    <body>
       <form class="col s12">
                <div class="row">
                    <div class="input-field col s6">
                        <input  id="nombre" type="text" class="validate">
                        <label for="nombre">Nombre</label>
                    </div>
                     <div class="input-field col s6">
                        <input  id="apellido" type="text" class="validate">
                        <label for="Apellido">Apellido</label>
                    </div>
                    <div class="input-field col s6">
                        <input  id="cedula" type="number" class="validate">
                        <label for="cedula">Cédula</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="fecha_nacimiento" type="date" class="validate">
                        <label for="Fecha de Nacimiento:">Fecha de Nacimiento</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="direccion" type="text" class="validate">
                        <label for="Dirección">Dirección:</label>
                    </div
                     <div class="input-field col s6">
                        <input  id="celular" type="number" class="validate">
                        <label for="Celular">Celular</label>
                    </div>
            </form>
        
    </body>
</html>
