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
    </head>
    <%
        HttpSession s = request.getSession();
        //variables de session
    %>
    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo" id="ulUserData" href="">${sessionScope.nombre}</a>
            
        </header>
        
        <div class="container">
            <form>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="adultomayor">Adulto mayor</label>
                        <select id="adultomayor" class="form-control">
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="paretesco">Parentesco</label>
                        <select id="paretesco" class="form-control">
                            <option value="Bisnieto(a)">Bisnieto(a)</option>
                            <option value="Cónyuge">Cónyuge</option>
                            <option value="Cuñado(a)">Cuñado(a)</option>
                            <option value="Hijo(a)">Hijo(a)</option>
                            <option value="Nieto(a)">Nieto(a)</option>
                            <option value="Primo(a)">Primo(a)</option>
                            <option value="Sobrino(a)">Sobrino(a)</option>
                            <option value="Tío(a)">Tío(a)</option>
                            <option value="Yerno(a)">Yerno(a)</option>
                            <option value="Otros">Otros</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="direcciontrabajo">Dirección de trabajo</label>
                    <input type="text" class="form-control" id="direcciontrabajo" placeholder="Av. 7 de Agosto, Calle Manuel Nogales y 7 de Marzo">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="telefonotrabajo">Télefono del tabajo</label>
                        <input type="tel" class="form-control" id="telefonotrabajo" maxlength="10" pattern="[0-9]{10}" placeholder="0999999999">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="extension">Extensión</label>
                        <input type="tel" class="form-control" id="extension" maxlength="3" pattern="[0-9]{3}" placeholder="000">
                    </div>
                </div>
                <button type="button" id="btnAgregar" class="button primary">Agregar</button>
                <a class="button primary" id="btnCancelar" href="Principal.jsp" role="button">Cancelar</a>
            </form>
        </div>
        <script type="text/javascript">
            var NuevoEvento;

            $(document).ready(llenarCombo);

            function llenarCombo() {
                $('#adultomayor').empty();
                $.getJSON('encargadoServlet?id='+ <%=session.getAttribute("id")%>, function (data) {
                    console.log(JSON.stringify(data));
                    $.each(data, function (k, v) {
                        $('#adultomayor').append($('<option></option>').attr('value', v.id).text(v.nombre));
                    });
                });
            }
            ;

            function limpiarForm() {
                llenarCombo();
                $('#paretesco').val('');
                $('#direcciontrabajo').val('');
                $('#telefonotrabajo').val('');
                $('#extension').val('');
            }

            function enviarDatosBD(objEvento, accionProceso) {
                $.ajax({
                    type: 'POST',
                    url: "newencargadoServlet?accion=" + accionProceso,
                    data: objEvento,
                    success: function (msg) {
                        if (msg) {
                            limpiarForm();
                        }
                    },
                    error: function () {
                        alert('Ocurrio un error');
                    }
                });
            }
            ;
            
            $('#btnAgregar').click(function () {
                NuevoEvento = {
                    id: 1,
                    idadulto: $('#adultomayor').val(),
                    parentesco: $('#paretesco').val(),
                    direcciontrabajo: $('#direcciontrabajo').val(),
                    telefonotrabajo: $('#telefonotrabajo').val(),
                    extensiontrabajo: $('#extension').val()
                };
                enviarDatosBD(NuevoEvento, 'agregar');
            });
        </script>
    </body>
</html>