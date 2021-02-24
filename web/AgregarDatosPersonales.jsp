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
        <link href="materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <script src="materialize/js/materialize.js" type="text/javascript"></script>
        <script src="materialize/js/materialize.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="Principal/css/main.css" />

        <title>Registrar Datos Personales</title>
    </head>

    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo center-align textgrueso " id="ulUserData"style="padding-top:6px; text-align:center; width:100%; font-size:20px; color:#ffffff" href="index.html">Registrar Datos Personales</a>
        </header>


        <form class="col s12">
            <div class="row">
                <div class="input-field col s6" style="margin-left:380px ; width: 350px">
                    <input  id="nombre" type="text" class="validate">
                    <label for="nombre">Nombre</label>
                </div>
                <div class="input-field col s6" style="width: 350px; margin-left:20px">
                    <input id="apellido" type="text" class="validate">
                    <label for="Apellido">Apellido</label>
                </div>

                <div class="row">
                    <div class="input-field col s12" style="margin-left:350px; width: 350px;">
                        <input  id="cedula" type="number" class="validate">
                        <label for="cedula">Cédula</label>
                    </div>
                    <div class="input-field col s6" style="width: 350px; margin-left:20px" >
                        <input id="fecha_nacimiento" type="date" class="validate">
                        <label for="Fecha de Nacimiento:">Fecha de Nacimiento</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12" style="width: 350px; margin-left:350px">
                        <input id="direccion" type="text" class="validate">
                        <label for="Dirección">Dirección:</label>
                    </div>

                    <div class="input-field col s6" style="width: 350px; margin-left:20px" >
                        <input id="celular" type="number" class="validate">
                        <label for="Celular">Celular</label>
                    </div>
                </div>
            </div>
        </form>
        <br>
    <center>
        <button class="btnnew first" onclick="onClickInsert()">Enviar</button>
    </center>
    
    <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
    <script src="js/app.js"></script>
    <script src="js/RegistrarUsuario.js"></script>

</body>
</html>