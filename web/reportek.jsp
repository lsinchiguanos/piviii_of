<%-- 
    Document   : reportek
    Created on : 03/02/2020, 12:38:16
    Author     : jean
--%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRPdfExporter"%>
<%@page import="net.sf.jasperreports.engine.JRExporter"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery-1.12.1.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <title>REPORTE</title>

  

    <body>
        <form name="enviar" action="reporteka.jsp" method="POST">
            <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title"  id="myModalLabel">Seleccione Reporte</h4>
                        </div>
                        <div class="modal-body">
                            Nombre:
                            <select id="cmbAdultoMayor" name="cmbAdulto" style="visibility: hidden">
                            </select>
                            <br> <br>
                            Reporte de Información:
                            <input id="btn1" type="submit" value="Generar" name="enviar" />
                            <br><br>
                            Reporte de Actividades:     
                            <input id="btn2" type="submit" value="Generar" name="enviar2" />
                            <!--  <a href="reporteka.jsp"> REPORTE </a>-->
                            <!-- <input type="button" onclick="seleccion()"/> -->
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%
            Conexion conn = new Conexion();
            Class.forName("org.postgresql.Driver");
            //  Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/pi_vi", "postgres", "1234");
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = conn.getConecction().createStatement();
            session.getAttribute("nombre");
            rs = smt.executeQuery("select u.nombres as Nombre,rec.titulo as TituloMed, rec.fecha_recordar as FechaRec, rec.hora_recordatorio as Hora, rec.descripcion as Descripcion, rec.fecha_creacion as FechCreacion from usuario u inner join recordatorio rec on u.id = rec.id_usuario_receptor where u.rol = 'AD' and u.username = '" + session.getAttribute("nombre") + "'");
            if (rs.next()) {
                File reportFile = new File(application.getRealPath("/reportes/reportek.jasper"));
                Map parameters = new HashMap();
                parameters.put("usuario", session.getAttribute("nombre"));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn.getConecction());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream salida = response.getOutputStream();
                response.getOutputStream();
                salida.write(bytes, 0, bytes.length);
                salida.flush();
                salida.close();
            } else {
                out.println("<script>");
                out.println("$(document).ready(function ()");
                out.println("{");
                out.println("$('#miModal').modal('show');");
                out.println("});");
                out.println("</script>");
            }
        %>
        <script type="text/javascript">
            $(document).ready(llenarCombo);
            function llenarCombo() {
                console.log(<%=session.getAttribute("id")%>);
                $("#cmbAdultoMayor").css("visibility", "visible");
                $("#cmbAdultoMayor").empty();
                $.getJSON('comboEncargado?id=' + <%=session.getAttribute("id")%>, function (data) {
                    $.each(data, function (k, v) {
                        $("#cmbAdultoMayor").append($('<option></option>').attr('value', v.nombre).text(v.nombre));
                    });
                });
            }
        </script>

    </body>
</html>
