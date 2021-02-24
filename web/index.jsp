<%-- 
    Document   : index
    Created on : 10-nov-2019, 10:28:21
    Author     : Mayra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>

<head>
    <title>Proyecto VI - Remenber me</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="icon" type="img/logoblancod.ico" href="img/logoblancod.ico"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/colores.css" rel="stylesheet" type="text/css"/>
    <link href="css/materialize.css" rel="stylesheet" type="text/css"/>
   
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>


<body>
    <form id="form1" action="Login1" name="frm1"  autocomplete="off">
        <!--Div del fondo colorido-->
        <div id="fondocolors" style="background-color:black">
            <!--Div para el logotipo-->
            <div id="divlogo">
                <div id="logotipo" style="display: inline-block">
                    <img src="img/logoblancod.png" alt= "Alternate Text">
                    <p>REMEMBER ME</p>         
                </div>      
            </div>
            <p style="margin-left:95px ; margin-top: 120px" class="textgrueso">Bienvenido a la nueva era</p>
            <p style="margin-left:95px ; margin-top: -1px" class="textdelgado">Control del seguimiento de recordatorios </p>

            <!--Div para el título y subtítulo-->
            <div id="divtitulo" >
                <div id="divsubt" style="opacity: 0">
                    <div style="display: inline-block;">

                    </div>
                </div>


                <!--Div de inicio de sesión-->
                <div class="divforlog" style=" margin-top: -200px">
                    <!--Panel blanco inicio de sesión-->
                    <div id="divlogin" style="display: inline-block">
                        <!--Títulos-->
                        <p class="textgrueso" style="padding-top:30px; text-align:center; width:100%; font-size:20px; color:#707070">INICIAR SESIÓN</p>
                        <img src="img/users.gif" alt="" style="height:150px; width: 180px; margin:auto; text-align:center; margin-top:5px"/>

                        <!--Nombre de usuario-->
                        <div class="input-field col s6" style="margin-left:0px; margin-right:10px; margin-top:-1px; height:30px;">
                            <img alt="" src="img/icons8_User_Male_30px.png" style="position:absolute; margin-left: 0px; margin-top:15px"/>
                            <input id="inputEmail" name="usuario" class="validate" type="text" style="width:240px; margin-left:40px; margin-top:2px">
                            <label for="UserName" style="width:270px; margin-left:78px;">
                                Nombre de usuario</label>
                        </div>
                        <!--Contraseña-->
                        <div class="input-field col s6" style="margin-left:0px; margin-right:10px; margin-top:55px; height:30px; top: 0px; left: 0px;">
                            <img alt="" src="img/icons8_Lock_2_30px.png" style="position:absolute; margin-left: 0px; margin-top:15px"/>
                            <input id="inputPassword" class="validate" type="password"  name="clave" style="width:240px; margin-left:40px; margin-top:2px">
                            <label for="clave" style="width:270px; margin-left:78px;">
                                Contraseña</label>

                        </div>
                      



                        <div style="position: absolute; width: 370px; margin-top:-10px; margin-left:3px;">

                            <p style="color:black; background-color:white; font-family:sans-serif; font-size:11px; text-align:center; margin-top:50px">

                                <span>
                                <button  id="btnLogin" class="btnnew first" style=" justify-content: center; align-items: center; margin-bottom: 5px; margin-top: 5px; width:50% ">ACCEDER</button>

                                </span>
                            </p>
                            <p style="color:black; background-color:white; font-family:sans-serif; font-size:11px; text-align:center; margin-top:40px">
                                <a id="LinkButton1" class="waves-effect waves-light btn modal-trigger" href="#modal1">
                                    <strong>Crear nueva cuenta</strong>
                                </a>

                            </p>

                          <!--------------MODAL REGISTRO------------------------------------------>

                            <div id="modal1" class="modal">
                             <div style="width:752px; height:70px; background-color: #2d72c8" class="textgrueso">Crear Usuario  </div>     
                             <div class=" modal-content" >
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input id="emailU" type="text" class="validate">
                                            <label for="usuarioU">Correo:</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input class ="textdelgado" id="contrasenaU" type="password" class="validate">
                                            <label for="contrasenaU">Contraseña:</label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button  id="btnLogin1" class="btnnew first" onclick="registrar()">Registrar</button>
                                        <button  href="#!" class="btnnew first" style=" ">Salir</button>
                                    </div>
                                </div>
                            </div>
                              
                          <!-------------- FIN MODAL REGISTRO------------------------------------------>
                          

                   </div>
                        <!--Final panel blanco inicio de sesión-->
                    </div>
                    <!--Final div inicio de sesión-->
                </div>


                <div id="diviconos">
                    <!--Párrafo con centrado vertical-->                                
                    <p id="paricons">
                        <img src="img/estruc.png" alt="Alternate Text" style="height:18px; width:18px; margin-left:-20px" />
                        <strong>&nbsp&nbsp MÓDULOS DE ESTA VERSIÓN</strong>
                    </p>

                    <div>
                        <img src="img/metal_detector_50px.png" alt="" style="display:block; margin:auto; text-align:center"/>
                        <p style="color:#2d72c8; font-size:16px" class="textgrueso">Recordatorios</p>
                        <p>Agrega, Modifica y Elimina tus recordatorios</p>
                    </div>

                    <div>
                        <img src="img/analyze_50px.png" alt="" style="display:block; margin:auto; text-align:center"/>
                        <p style="color:#2d72c8; font-size:16px" class="textgrueso">Reportes</p>
                        <p>Mostrar el detalle de las activididades asignadas</p>
                    </div>
 <!--Párrafo con centrado vertica  
                    <div>
                        <img src="img/order_history_50px.png" alt="" style="display:block; margin:auto; text-align:center"/>
                        <p style="color:#2d72c8; font-size:16px" class="textgrueso">Historial</p>
                        <p>Mostrar la información de las activididades asignadas</p>
                    </div>


                </div>
            </div>
s
        </div>
    </form>

    <!--Boton de acceso-->
    <!--boton googl-->
     <script src="js/materialize.js" type="text/javascript"></script>
    <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
    <script src="js/app.js"></script>
    <script src="js/authentication.js"></script>
    <script src="js/RegistrarUsuario.js"></script>
    
    
    <!--NO TOCAR ABIRR MODAL-->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.modal');
            var instances = M.Modal.init(elems);
        });
    </script> 

</body>






