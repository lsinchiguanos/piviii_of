<%-- 
    Document   : usuariosB
    Created on : 11-feb-2020, 11:07:03
    Author     : sinchijr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="img/logoblancod.ico" href="img/logoblancod.ico"/>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="stylesheet" href="Principal/css/main.css" />
        <script src="lib/js/jquery.min.js" type="text/javascript"></script>
        <link href="materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Pacientes</title>
    </head>
    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo center-align textgrueso " id="ulUserData"style="padding-top:6px; text-align:center; width:100%; font-size:20px; color:#707070" href="Principal.jsp">Registrar Usuario</a>
        </header>
        <div class="input-field col s6">
            <input id="email" type="email" class="validate" placeholder="Usuario" >
        </div>
        <div class="input-field col s6">
            <input id="pass" type="password" class="validate" placeholder="contraseña" >
        </div>
        <div class="input-field col s6">
            <input id="nombre" type="text" class="validate" placeholder="nombre" >
        </div>
        <div class="input-field col s6">
            <input id="apellido" type="text" class="validate" placeholder="apellido" >
        </div>
        <div class="input-field col s6">
            <input id="cedula" type="number" class="validate" placeholder="cedula" >
        </div>
        <div class="input-field col s6">
            <input id="fecha_nacimiento" type="date" class="validate" placeholder="fecha_nacimiento" >
        </div>
        <div class="input-field col s6">
            <input id="direccion" type="text" class="validate" placeholder="direccion" >
        </div>
        <div class="input-field col s6">
            <input id="celular" type="number" class="validate" placeholder="celular" >
        </div>
        <div id="contenido">
        </div>

        <button onclick="enviar()">Enviar</button><br><br>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="js/app.js"></script>
        <script src="js/AgregarPacientes.js"></script>

    </body>
</html>