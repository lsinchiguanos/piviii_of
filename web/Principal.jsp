<%-- 
    Document   : Principal
    Created on : 11-nov-2019, 13:23:47
    Author     : Mayra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto VIII - Remenber me</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="img/logoblancod.ico" href="img/logoblancod.ico"/>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="stylesheet" href="Principal/css/main.css" />
    </head>
    <body class="is-preload">    
        <!-- Encabezado -->
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo" id="ulUserData" href="index.html">${sessionScope.nombre}</a>
            <nav>
                <a href="#menu" style="color:white" >Configuración</a>
            </nav>
        </header>
        <!-- Nav -->
        <nav id="menu"  style="color:white">
            <ul class="links">
                <li><a href="index.html" >Inicio</a></li>
                <li><a href="ReporteKi.jsp" style="" >Reportes</a></li>
                <li><a href="ActualizarDatosPersonales.jsp" style="" >ActualizarDatosPersonales</a></li>
                <li><a href="ActualizarDatosPacientes.jsp" style="" >ActualizarDatosPacientes</a></li>
                <li><a href="AgregarPaciente.jsp" style="" >Agregar Paciente</a></li>
                <li><a href="dispositivo.jsp" style="" >Asignar dispositivo</a></li>
                <li><a href="#" onclick="cerrar()">Cerrar sesion</a></li>
                <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
                <script src="js/app.js"></script>
                <script src="js/CerrarConexion.js"></script>
            </ul>
        </nav>
        <!-- container principal -->
        <section class="wrapper">
            <div class="inner">
                <div class="highlights">

                    <!-- PRIMER MODULO -->
                    <section>
                        <div class="content">
                            <header>
                                <a href="recordatorios.jsp">
                                    <img alt="" src="img/metal_detector_50px.png">
                                    <span class="label"></span></a>
                                <h3 style="color:#2d72c8; font-weight: bold">Recordatorios</h3>
                            </header>
                            <p>Agrega, Modifica, Elimina, tus recordatorios</p>
                            <a href="recordatorios.jsp" class="button primary">Acceder</a>
                        </div>
                    </section>

                    <!-- SEGUNDO MODULO -->
                    <section>
                        <div class="content">
                            <header>
                                <a href="ReporteKi.jsp" >
                                    <img alt="" src="img/analyze_50px.png">
                                    <span class="label"></span></a>
                                <h3 style="color:#2d72c8; font-weight: bold">Reportes</h3>
                            </header>
                            <p>Mostrar el detalle de las activididades asignadas </p>
                            <a href="ReporteKi.jsp" class="button primary">Acceder</a>
                        </div>
                    </section>

                    <!-- TERCER MODULO -->
                  

                </div>
            </div>
        </section>

        <!-- Scripts -->
        <script src="Principal/js/jquery.min.js"></script>
        <script src="Principal/js/browser.min.js"></script>
        <script src="Principal/js/breakpoints.min.js"></script>
        <script src="Principal/js/util.js"></script>
        <script src="Principal/js/main.js"></script>
    </body>
</html>