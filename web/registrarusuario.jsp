<%-- 
    Document   : registrarusuario
    Created on : 05-feb-2020, 14:53:14
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
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo center-align textgrueso " id="ulUserData"style="padding-top:6px; text-align:center; width:100%; font-size:20px; color:#707070" href="index.html">Registrar Usuario</a>
            <script>
                $(document).ready(function () {             // When the HTML DOM is ready loading, then execute the following function... 
                    $('#login').submit(function () {           // Locate HTML element with ID "calculator" and execute the following function on its "submit" event... 
                        $form = $(this);               // Wrap the form in a jQuery object first (so that special functions are available). 
                        $.post($form.attr('action'), $form.serialize(), function (responseText) { // Execute Ajax POST request on URL as set in <form action> with all input values of the form as parameters and execute the following function with Ajax response text... 
                            $('#respuesta').text(responseText);          // Locate HTML element with ID "result" and set its text content with responseText. 
                        });
                        return false;               // Prevent execution of the synchronous (default) submit action of the form. 
                    });
                });
            </script> 
        </header>
        <div class="row">
            <form class="col s12" method="post" name="formacedula">
                <div class="input-field col s6">
                    <input id="Nombres" type="text" class="validate" >
                    <label for="Nombres">Nombres:</label>
                </div>
                <div class="input-field col s6">
                    <input id="Apellidos"  type="text" class="validate" >
                    <label for="Apellidos">Apellidos:</label>
                </div>
                <div class="input-field col s6">
                    <input id="input_text" type="text" class="validate" maxlength="10" onchange="validarcedula()">
                    <label for="fbdgs">Cedula:</label>
                </div>
                <div class="input-field col s6">
                    <input id="FechadeNacimiento" type="text" class="datepicker">
                    <label for="FechadeNacimiento">Fecha de Nacimiento:</label>
                </div>
                <div class="input-field col s6">
                    <input id="Correoelectronico"  type="email" class="validate"  >
                    <label for="Correoelectronico">Correo electrónico:</label>
                </div>
                <div class="input-field col s6">
                    <input id="Celular" type="tel" class="validate"  >
                    <label for="Celular">Celular:</label>
                </div>
                <div class="input-field col s6">
                    <input id="Direccion" type="text" class="validate" >
                    <label for="Direccion">Dirección:</label>
                </div>
                <div class="input-field col s6">
                    <input id="Usuario" type="text" class="validate" >
                    <label for="Usuario">Usuario:</label>
                </div>
                <div class="input-field col s6">
                    <input id="Contrasena" type="password" class="validate" >
                    <label for="Contrasena">Contraseña:</label>
                </div>
                <div class="col s6">
                    <label>¿Usted es?:</label>
                    <select class="browser-default" id="Rol">
                        <option value="" disabled selected>Escoje una opcion:</option>
                        <option value="AD">Adulto mayor</option>
                        <option value="CP">Cuidador</option>
                    </select>
                </div>
                <div class="input-field col s6">
                    <input id="telefonoemergencia" type="tel" class="validate" value="0999999999">
                    <label for="telefonoemergencia">Télefono de emergencia:</label>
                </div>
                <center>
                    <button class="waves-effect waves-light btn-large" id="btnGuardar">Guardar</button>
                </center>
            </form>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var elems = document.querySelectorAll('.datepicker');
                    var instances = M.Datepicker.init(elems);
                });
            </script>


            <script type="text/javascript">

                var NuevoUsuario;
                function limpiarFormario() {
                    $('#input_text').val('');
                    $('#Nombres').val('');
                    $('#Apellidos').val('');
                    $('#FechadeNacimiento').val('');
                    $('#Correoelectronico').val('');
                    $('#Celular').val('');
                    $('#Direccion').val('');
                    $('#Usuario').val('');
                    $('#Contrasena').val('');
                    $('#Rol').val('');
                    $('#telefonoemergencia').val('');
                };

                function recolectarInformacion() {
                    NuevoUsuario = {
                        cedula: $('#input_text').val(),
                        nombres: $('#Nombres').val(),
                        apellidos: $('#Apellidos').val(),
                        fecha_nacimiento: $('#FechadeNacimiento').val(),
                        correo_electronico: $('#Correoelectronico').val(),
                        numero_celular: $('#Celular').val(),
                        direccion_vivienda: $('#Direccion').val(),
                        username: $('#Usuario').val(),
                        contrasenia: $('#Contrasena').val(),
                        rol: $('#Rol').val(),
                        telefonoemergencia: $('#telefonoemergencia').val()
                    };
                }
                ;

                function enviarDatosBD(objEvento, accionProceso) {
                    $.ajax({
                        type: 'POST',
                        url: "usuarioServlet?accion=" + accionProceso,
                        data: objEvento,
                        success: function (msg) {
                            if (msg) {
                                limpiarFormario();
                                alert('Registrado éxitosamente');
                                location.href = 'ListarUsuarios.jsp';
                            }
                        },
                        error: function () {
                            alert('Ocurrio un error');
                        }
                    });
                }
                ;

                $('#btnGuardar').click(function () {
                    recolectarInformacion();
                    enviarDatosBD(NuevoUsuario, 'agregar');

                });

            </script>

            <script type="text/javascript">
                function validarcedula()
                {
                    var i;
                    var cedula;
                    var acumulado;
                    cedula = document.formacedula.input_text.value;
                    var instancia;
                    acumulado = 0;
                    for (i = 1; i <= 9; i++)
                    {
                        if (i % 2 != 0)
                        {
                            instancia = cedula.substring(i - 1, i) * 2;
                            if (instancia > 9)
                                instancia -= 9;
                        } else
                            instancia = cedula.substring(i - 1, i);
                        acumulado += parseInt(instancia);
                    }
                    while (acumulado > 0)
                        acumulado -= 10;
                    if (cedula.substring(9, 10) != (acumulado * -1))
                    {
                        alert("Cedula no valida!!");
                        //document.formacedula.textocedula.setfocus();
                        document.getElementById("input_text").value = "";
                    }
                    //alert("Cedula valida !!");
                    //const boton=document.getElementById("btnGuardar");
                    //boton.click();
                }
            </script>
        </div>
        <script src="materialize/js/materialize.js" type="text/javascript"></script>
        <script src="materialize/js/materialize.min.js" type="text/javascript"></script>
    </body>
</html>