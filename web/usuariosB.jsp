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
        <title>Registro Usuarios</title>
    </head>
    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="index.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo center-align textgrueso " id="ulUserData"style="padding-top:6px; text-align:center; width:100%; font-size:20px; color:#707070" href="index.html">Registrar Usuario</a>
        </header>
        <div class="row">
            <form class="col s12" method="post" name="formacedula">
                <div class="input-field col s6">
                    <input id="email" type="text" class="validate" placeholder="Usuario" >
                </div>
                <div class="input-field col s6">
                    <input id="contrasena" type="password" class="validate" placeholder="contraseña" >
                </div>
                <div id="contenido">
                </div>


            </form>
            <script src="js/RegistrarUsuario.js"></script>
            <button class="btn btn-primary btn-user btn-block" id="btnLogin" onclick="registrar()"> Registrar</button>
            
            <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
            <script src="js/app.js"></script>
            <script src="js/authentication.js"></script>
           

    </body>
</html>