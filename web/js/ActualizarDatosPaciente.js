/* global firebase */

var db = firebase.database();

function value(request) {
    return  document.getElementById(request).value;
}
function actualizar(request, response) {
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
    return "AdultoMayor";
}
function ActualizarDatos(nombre, apellido, cedula, fecha_nacimiento, direccion, celular) {
    var user = firebase.auth().currentUser;
    var f = user.uid;
    db.ref('usuario/' + f).update({
        nombre: nombre,
        apellido: apellido,
        cedula: cedula,
        fecha_nacimiento: fecha_nacimiento,
        direccion: direccion,
        celular: celular,
        fecha_update: dateActuality(),
        rol: rol()
    });
}
function Actualizar() {
    var nombre = value("nombre");
    var apellido = value("apellido");
    var cedula = value("cedula");
    var direccion = value("direccion");
    var fecha_nacimiento = value("fecha_nacimiento");
    var celular = value("celular");
    if (nombre.length == 0 || apellido.length == 0 || cedula.length == 0 || fecha_nacimiento.length == 0 || direccion.length == 0 || celular.length == 0) {
        alert("empty field");
    } else {
        ActualizarDatos(nombre, apellido, cedula, fecha_nacimiento, direccion, celular);
        actualizar("nombre", "");
        actualizar("apellido", "");
        actualizar("cedula", "");
        actualizar("direccion", "");
        actualizar("celular", "");
        actualizar("fecha_nacimiento", "");
        alert("Actualizado correctamente");
        window.location.replace('Principal.jsp');
    }
}

//ACTUALIZAR INFORMACION DE DATOS PERSONALES