/* global firebase */
var db = firebase.database();

function value(request) {
    return  document.getElementById(request).value;
}
;

function asignation(request, response) {
    return  document.getElementById(request).value = response;
}
;

function fechaCreacion() {
    var fh = new Date();
    return fh.getFullYear() + "-" + (fh.getMonth() + 1) + "-" + fh.getDate() + " " + fh.getHours() + ":" + fh.getMinutes();
}
;

function rol()
{
    return "AdultoMayor";
}
;

function Actualizacion() {
    var h = new Date();
    return h.getHours() + ":" + h.getMinutes();
}
;

function enviar() {
    var user1 = firebase.auth().currentUser;
    var f = user1.uid;
    var email = document.getElementById('email').value;
    var pass = document.getElementById('pass').value;
    firebase.auth().createUserWithEmailAndPassword(email, pass)
            .catch(function (error) {
                var errorCode = error.code;
                var errorMessage = error.message;
                alert(errorMessage);
            })
            .then(function (user2) {
                var nombre = value("nombre");
                var apellido = value("apellido");
                var cedula = value("cedula");
                var fecha_nacimiento = value("fecha_nacimiento");
                var direccion = value("direccion");
                var celular = value("celular");
                db.ref('registro/' + f + '/' + user2.user.uid).set({
                    nombre: nombre
                });
                db.ref('usuario/' + user2.user.uid).set({
                    nombre: nombre,
                    apellido: apellido,
                    cedula: cedula,
                    fecha_nacimiento: fecha_nacimiento,
                    direccion: direccion,
                    celular: celular,
                    fecha_create: fechaCreacion(),
                    rol: rol(),
                    fecha_update: Actualizacion()
                });
                alert("El usuario ha sido creado");
                window.location.replace('Principal.jsp');

            });
}
;