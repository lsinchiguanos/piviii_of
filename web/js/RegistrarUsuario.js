/* global firebase */

//REGISTRAR
function registrar() {
    var email = document.getElementById('emailU').value;
    var contrasena = document.getElementById('contrasenaU').value;

    firebase.auth().createUserWithEmailAndPassword(email, contrasena)
            .then(function () {
                verficar();

            })

            .catch(function (error) {
                // Handle Errors here.
                var errorCode = error.code;
                var errorMessage = error.message;
                console.log(errorCode);
                console.log(errorMessage);
                // ...
            });
}
function verficar() {
    var user = firebase.auth().currentUser;
    user.sendEmailVerification().then(function () {
        // Email sent.
        //console.log('Enviando correo...');
        alert("Usuario Creado ");
        //var f = user.uid;
        //console.log(f);
        window.location.replace('AgregarDatosPersonales.jsp');

    }).catch(function (error) {
        // An error happened.
        console.log(error);
    });
}
//CREA DATOS PERSONALES
var db = firebase.database();

function value(request) {
    return  document.getElementById(request).value;
}
function asignation(request, response) {
    return  document.getElementById(request).value = response;
}
function dateActuality() {
    var fh = new Date();
    return fh.getFullYear() + "-" + (fh.getMonth() + 1) + "-" + fh.getDate() + " " + fh.getHours() + ":" + fh.getMinutes();
}
function Actualizacion() {
    var h = new Date();
    return h.getHours() + ":" + h.getMinutes();
}
function rol()
{
    return "enfermero";
}
function insertTask(nombre, apellido, cedula, fecha_nacimiento, direccion, celular) {
    var user = firebase.auth().currentUser;
    var f = user.uid;
    db.ref('usuario/' + f).set({
        nombre: nombre,
        apellido: apellido,
        cedula: cedula,
        fecha_nacimiento: fecha_nacimiento,
        direccion: direccion,
        celular: celular,
        fecha_create: dateActuality(),
        fecha_update: Actualizacion(),
        rol: rol()
    });
}
function onClickInsert() {
    var nombre = value("nombre");
    var apellido = value("apellido");
    var cedula = value("cedula");
    var direccion = value("direccion");
    var fecha_nacimiento = value("fecha_nacimiento");
    var celular = value("celular");
    if (nombre.length == 0 || apellido.length == 0 || cedula.length == 0 || fecha_nacimiento.length == 0 || direccion.length == 0 || celular.length == 0) {
        alert("empty field");
    } else {
        insertTask(nombre, apellido, cedula, fecha_nacimiento, direccion, celular);
        asignation("nombre", "");
        asignation("apellido", "");
        asignation("cedula", "");
        asignation("direccion", "");
        asignation("celular", "");
        asignation("fecha_nacimiento", "");
        alert("Registro Guardado");
        window.location.replace('index.jsp');
    }
}

//ACTUALIZAR INFORMACION DE DATOS PERSONALES