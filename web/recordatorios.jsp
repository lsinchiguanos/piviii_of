<%-- 
    Document   : agenda
    Created on : 01-feb-2020, 9:17:44
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
        <link href="Principal/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

        <!-- LIBRERÍAS NORMALES -->
        <script src="lib/js/jquery.min.js"></script>
        <script src="lib/js/moment.min.js"></script>

        <!-- RELOJ -->
        <link href="lib/css/jquery-clockpicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="lib/js/jquery-clockpicker.min.js" type="text/javascript"></script>

        <!-- NECESARIO PARA EL MODAL -->
        <link rel="stylesheet" href="lib/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <!-- FULL CALENDAR -->
        <link rel="stylesheet" href="lib/css/fullcalendar.min.css">
        <script src="lib/js/fullcalendar.min.js"></script>
        <script src="lib/js/es.js" type="text/javascript"></script>

    </head>
    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
        </header>
        <div style="width:15px; height:20px"></div>

        <div class="row">
            <form class="col-12">
                <button type="button" class="btn" data-toggle="modal" data-target="#eventoModal">Registrar</button>
            </form>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="eventoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="tituloEvento"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">DATOS GENERALES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">CONFIGURACIÓN</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <input type="hidden" name="txtId" id="txtId" value="0">
                                <input type="hidden" id="txtCreador">
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label>Destinatario:</label>
                                        <select id="txtDestinatario" class="form-control" required>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>Mensaje:</label>
                                        <textarea id="txtMensaje" class="form-control" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Fecha:</label>
                                        <div class="input-group">
                                            <input type="text" id="txtFecha" class="form-control" placeholder="aaaa-mm-dd" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Hora a recordar:</label>
                                        <div class="input-group clockpicker" data-autoclose="true">
                                            <input type="text" id="txtHora" class="form-control" required maxlength="5">
                                            <span class="input-group-addon">
                                                <i class="fa fa-clock-o fa-fw fa-2x"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnAgregar" class="button primary">Agregar</button>
                        <button type="button" id="btnModificar" class="button primary">Modificar</button>
                        <button type="button" id="btnBorrar" class="button primary">Borrar</button>
                    </div>
                </div>
            </div>
        </div>        

        <script type="text/javascript">
            var NuevoEvento;

            $('.clockpicker').clockpicker({'default': 'now'});

            function limpiarFormario() {
                $('#txtId').val('0');
                $('#txtMensaje').val('');
                $('#txtDestinatario').val('');
                $('#txtFecha').val('');
                $('#txtHora').val('');
            }
            ;

            function llenarCombo() {
                $("#txtDestinatario").empty();
                $.getJSON('destinatarios?id=' + <%=session.getAttribute("id")%>, function (data) {
                    console.log(JSON.stringify(data));
                    $.each(data, function (k, v) {
                        $("#txtDestinatario").append($('<option></option>').attr('value', v.id).text(v.destinatario));
                    });
                });
            }
            ;

            function enviarDatosBD(objEvento, accionProceso) {
                $.ajax({
                    type: 'POST',
                    url: "recordatorioServlet?accion=" + accionProceso,
                    data: objEvento,
                    success: function (msg) {
                        if (msg) {
                            $('#CalendarioWeb').fullCalendar('refetchEvents');
                            $('#eventoModal').modal('toggle');
                        }
                    },
                    error: function () {
                        alert('Ocurrio un error');
                    }
                });
            }
            ;

            function recolectarInformacion() {
                var fechaInita = $('#txtFecha').val();
                var horaInita = $('#txtHora').val();
                fechaInita = fechaInita + " " + horaInita;
                NuevoEvento = {
                    id: $('#txtId').val(),
                    userdestined: $('#txtDestinatario').val(),
                    title: $('#txtMensaje').val(),
                    start: $('#txtFecha').val() + " " + $('#txtHora').val(),
                    end: $('#txtFecha').val() + " " + $('#txtHora').val(),
                    horaaviso: $('#txtHora').val()
                };
            }
            ;

            $('#btnAgregar').click(function () {
                recolectarInformacion();
                enviarDatosBD(NuevoEvento, 'agregar');
            });

            $('#btnBorrar').click(function () {
                recolectarInformacion();
                enviarDatosBD(NuevoEvento, 'eliminar');
            });

            $('#btnModificar').click(function () {
                recolectarInformacion();
                enviarDatosBD(NuevoEvento, 'actualizar');
            });

        </script>

        <script type="text/javascript">
            var FechaHora;
            $(document).ready(function () {
                $('#CalendarioWeb').fullCalendar({
                    dayClick: function (date, jsEvent, view) {
                        //var m = moment(date.format()).format('L');
                        limpiarFormario();
                        $('#txtFecha').val(date.format());
                        llenarCombo();
                        $('#eventoModal').modal();
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        llenarCombo();
                        limpiarFormario();
                        $('#txtId').val(calEvent.id);
                        $('#txtDestinatario').val(calEvent.userdestined);
                        FechaHora = calEvent.start._i.split(" ");
                        $('#txtFecha').val(FechaHora[0]);
                        $('#txtHora').val(FechaHora[1]);

                        $('#eventoModal').modal();
                    },
                    events: 'eventosRenderServlet'
                });
            });
        </script>
    </body>
</html>