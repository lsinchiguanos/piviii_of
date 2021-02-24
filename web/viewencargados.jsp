<%-- 
    Document   : viewencargados
    Created on : 05-feb-2020, 23:35:16
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
        <link href="lib/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="lib/js/jquery.min.js" type="text/javascript"></script>
    </head>
    <%
        HttpSession s = request.getSession();
        //variables de session
    %>
    <body class="is-preload">
        <header id="header">
            <a class="logo" href="index.jsp"></a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>
        <nav id="menu">
            <ul class="links">
                <li><a href="">kjlkjkl</a></li>
                <li><a href="">jkjkljl</a></li>
                <li><a href="">jkjkljl</a></li>
            </ul>
        </nav>
        <div class="container">
            <form>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First</th>
                            <th scope="col">Last</th>
                            <th scope="col">Handle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <script type="text/javascript">
            var NuevoEvento;

            $(document).ready(llenarCombo);

            function llenarCombo() {
                $('#adultomayor').empty();
                $.getJSON('encargadoServlet?id=' + <%=session.getAttribute("id")%>, function (data) {
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
