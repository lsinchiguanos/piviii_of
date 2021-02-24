<%-- 
    Document   : Principal
    Created on : 11-nov-2019, 13:23:47
    Author     : Mayra
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
        <link href="materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <script src="materialize/js/materialize.js" type="text/javascript"></script>
        <script src="materialize/js/materialize.min.js" type="text/javascript"></script>
        <title>Asignar Dispositivos</title>
    </head>
    <body class="is-preload" onload="main()">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo center-align textgrueso " id="ulUserData"style="padding-top:6px; text-align:center; width:100%; font-size:20px; color:#ffffff" href="Principal.jsp">Actualizar Datos Pacientes</a>
        </header>

        <div class="row">
            <form class="col-12">
                <div class="row">
                    <div class="input-field col s6">
                        <input placeholder="Dispositivo del cuarto" id="alias" type="text" required="true">
                        <label for="alias">Alias</label>
                    </div>
                    <div class="input-field col s6">
                        <input placeholder="00:0a:95:9d:68:16" id="mac" type="text" required="true">
                        <label for="mac">MAC del dispositivo</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <select id="pacienteDispositivo">
                        </select>
                        <label>Paciente</label>
                    </div>
                </div>
                <button type="button" class="btn waves-effect waves-light" id="btnaggdatosDispositivo">Guardar</button>
            </form>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-auth.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-database.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/dispositivo.js" type="text/javascript"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.7.1/js/all.js" integrity="sha384-eVEQC9zshBn0rFj4+TU78eNA19HMNigMviK/PU/FFjLXqa/GKPgX58rvt5Z8PLs7"
        crossorigin="anonymous"></script>
</html>