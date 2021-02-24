<%-- 
    Document   : Registro
    Created on : 12-nov-2019, 23:52:45
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
        <link href="lib/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="lib/js/jquery.min.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    </head>
    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
        </header>
        <div class="container">
            <br/>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Direccion MAC</span>
                </div>
                <input type="text" class="form-control" style="background: #ffffff;" id="txtMac">
            </div>
            <br/> <br/>
            <button id="btnVisualizar" type="button" onclick="getRecordatorio()">Visualizar</button>
            <button id="btnLimpiar" type="button" onclick="eliminarFila()">Limpiar</button>
            <button id="btnPDF" type="button">Descargar PDF</button>
        </div>
        <div class="container">
            <br/> <br/>

            <table class="table" id="contentTable">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Mensaje</th>
                        <th scope="col">Estado</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-auth.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-database.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/reporte.js" type="text/javascript"></script>
    </body>
</html>