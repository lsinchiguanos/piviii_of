<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Reporte</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="Principal/css/main.css" />
        <link rel="stylesheet" href="HistorialJean/css/dataTables.bootstrap.min.css">
    </head>
    <body>
         <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo" id="ulUserData" href="">${sessionScope.nombre}</a>
            
        </header>
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Conexion con = new Conexion();
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.getConecction().createStatement();
            session.getAttribute("nombre");
            rs = smt.executeQuery("select u.nombres as Nombre,rec.titulo as TituloMed, rec.fecha_recordar as FechaRec, rec.hora_recordatorio as Hora, rec.descripcion as Descripcion, rec.fecha_creacion as FechCreacion from usuario u inner join recordatorio rec on u.id = rec.id_usuario_receptor where u.rol = 'AD' and u.username = '" + session.getAttribute("nombre") + "'");
            if (rs.next()) {
                rs = smt.executeQuery("select u.nombres as Nombre,rec.titulo as TituloMed, rec.fecha_recordar as FechaRec, rec.hora_recordatorio as Hora, rec.descripcion as Descripcion, rec.fecha_creacion as FechCreacion from usuario u inner join recordatorio rec on u.id = rec.id_usuario_receptor where u.rol = 'AD' and u.username = '" + session.getAttribute("nombre") + "'");

        %>
        <h1><%= session.getAttribute("nombre")%> </h1>
        <table class="table display AllDataTables" border="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Titulo</th>
                    <th>FechaRecordar</th>
                    <th>HoraRecordatorio</th>
                    <th>Descripcion</th>
                    <th>FechaCreacion</th>
                </tr>
            </thead>
            <tbody>
                <%                  
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("Nombre")%></td>
                    <td><%= rs.getString("TituloMed")%></td>
                    <td><%= rs.getDate("FechaRec")%></td>
                    <td><%= rs.getString("Hora")%></td>
                    <td><%= rs.getString("Descripcion")%></td>
                    <td><%= rs.getDate("FechCreacion")%></td>

                </tr>

                <%}%>
            </tbody>
        </table>  
        <%
        } else {
            rs = smt.executeQuery("select us.apellidos || ' '|| us.nombres as NombreCuidador, (select apellidos || ' '|| nombres as NombreAD from usuario where id=re.id_usuario_receptor),re.titulo as titulo,re.descripcion as descripcion,us.fecha_nacimiento as FechNacAD,us.correo_electronico as Correo, us.numero_celular as Celular,us.direccion_vivienda as vivienda,re.fecha_recordar as Frecor, re.hora_recordatorio as Frecordatorio from recordatorio re inner join usuario us on re.id_usuario_creador=us.id where us.username = '" + session.getAttribute("nombre") + "'");

        %>
        <table class="table display AllDataTables">
            <thead>
                <tr>
                    <th>NombreCuidador</th>
                    <th>NombreAD</th>
                    <th>Titulo</th>
                    <th>Descripcion</th>
                    <th>fecha_nacimientoAD</th>
                    <th>correo_electronicoAD</th>
                    <th>numero_celularAD</th>
                    <th>direccion_viviendaAD</th>
                    <th>fecha_recordar</th>
                    <th>hora_recordatorio</th>
                </tr>
            </thead>
            <tbody>
                <%                   
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("NombreCuidador")%></td>
                    <td><%= rs.getString("NombreAD")%></td>
                    <td><%= rs.getString("titulo")%></td>
                    <td><%= rs.getString("descripcion")%></td>
                    <td><%= rs.getString("FechNacAD")%></td>
                    <td><%= rs.getString("Correo")%></td>
                    <td><%= rs.getString("Celular")%></td>
                    <td><%= rs.getString("vivienda")%></td>
                    <td><%= rs.getDate("Frecor")%></td>
                    <td><%= rs.getString("Frecordatorio")%></td>                    
                </tr>
                <%}
                %>
            </tbody>
        </table>
        <%}%>
        <script src="HistorialJean/js/jquery-3.2.1.min.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="HistorialJean/js/jquery.dataTables.min.js"></script>
        <script src="HistorialJean/js/dataTables.bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.AllDataTables').DataTable({
                    language: {
                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    }
                });
            });
        </script>
    </body>
</html>