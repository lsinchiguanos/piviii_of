<%-- 
    Document   : reporteka
    Created on : 04-feb-2020, 13:15:19
    Author     : Kike
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    <body>
        <h1><%=request.getParameter("enviar")%></h1>
        <h1><%=request.getParameter("enviar2")%></h1>
        <%
            Conexion conn = new Conexion();
            Class.forName("org.postgresql.Driver");
            Statement smt;
            ResultSet rs;
            smt = conn.getConecction().createStatement();
            String a = request.getParameter("enviar2");
            File reportFile;
            System.out.println(a);
            if (a == null) {
                 reportFile = new File(application.getRealPath("/reportes/al.jasper"));
                Map parameters = new HashMap();
                //parameters.put("usuario", session.getAttribute("nombre"));
                parameters.put("usuario", session.getAttribute("nombre"));
                String adulto = request.getParameter("cmbAdulto");
                parameters.put("adulto", adulto);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn.getConecction());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream salida = response.getOutputStream();
                response.getOutputStream();
                salida.write(bytes, 0, bytes.length);
                salida.flush();
                salida.close();
                
                
               
            } else {
                reportFile = new File(application.getRealPath("/reportes/reporteka.jasper"));
                Map parameters = new HashMap();
                //parameters.put("usuario", session.getAttribute("nombre"));
                parameters.put("usuario", session.getAttribute("nombre"));
                String adulto = request.getParameter("cmbAdulto");
                parameters.put("adulto", adulto);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn.getConecction());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream salida = response.getOutputStream();
                response.getOutputStream();
                salida.write(bytes, 0, bytes.length);
                salida.flush();
                salida.close();
            }

        %>
    </body>
</html>
