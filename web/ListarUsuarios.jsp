<%-- 
    Document   : ListarUsuarios
    Created on : 07-feb-2020, 22:17:50
    Author     : Mayra
--%>
<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <link rel="shortcut icon" href="#" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->    
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- FontAwesom CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">        
        <!--Sweet Alert 2 -->
        <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">        
        <!--CSS custom -->  
        <link rel="stylesheet" href="main.css"> 
        <link href="materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/> 
    </head>
    <body>  
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Conexion con = new Conexion();
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.getConecction().createStatement();
            rs = smt.executeQuery("select * from usuario");
            //Creamo la Tabla:     
        %>
        <div>               
            <div class="row">       
                <div class="col">        
                    <button class="btn btn-primary" title="Nuevo Usuario"><a href="registrarusuario.jsp" ><i class="fas fa-plus-circle fa-2x"></i></a></button>
                </div>  
            </div>             
            <div class="row mt-5">
                <div class="col-lg-12">                    
                    <table class="table table-striped">
                        <thead>
                            <tr class="bg-primary text-light">                                   
                                <th>Nombre</th>
                                <th>Apellidos</th>  
                                <th>Cedula</th>
                                <th>Fecha_nacimiento</th>                                    
                                <th>Correo Electronico</th>
                                <th>Numero Celular</th>
                                <th>Direccion Vivienda</th>
                                <th>Username</th>                                    
                                <th>Acciones</th>
                            </tr>    
                        </thead>
                        <tbody id="tbodys">
                            <%
                                while (rs.next()) {
                            %>
                            <tr>  
                                <td><%= rs.getString("nombres")%></td>   
                                <td><%= rs.getString("apellidos")%></td> 
                                <td><%= rs.getString("cedula")%></td>   
                                <td><%= rs.getString("fecha_nacimiento")%></td>   
                                <td><%= rs.getString("correo_electronico")%></td>   
                                <td><%= rs.getString("numero_celular")%></td>   
                                <td><%= rs.getString("direccion_vivienda")%></td>  
                                <td><%= rs.getString("username")%></td>   


                                <td>
                                    <div class="btn-group" role="group">
                                        <a href="Editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary">Editar</a>
                                        <a href="Delete.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger">Delete</a>
                                    </div>
                                </td>
                            </tr>  
                            <%}%>
                        </tbody>
                    </table>                    
                </div>
            </div>
        </div> 

        <!-- jQuery, Popper.js, Bootstrap JS -->
        <script src="jquery/jquery-3.3.1.min.js"></script>
        <script src="popper/popper.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>                  
        <!--Axios -->      
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.15.2/axios.js"></script>    
        <!--Sweet Alert 2 -->        
        <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>      
        <!--Código custom -->          
        <script src="main.js"></script>    
        <script src="materialize/js/materialize.js" type="text/javascript"></script>
        <script src="materialize/js/materialize.min.js" type="text/javascript"></script>

    </body>
</html>
