var db = firebase.database();

function value(request) {
    return  document.getElementById(request).value;
}
function asignation(request, response) {
    return  document.getElementById(request).value = response;
}
function printHTML(request, response) {
    return document.getElementById(request).innerHTML += response;
}
function inHTML(request, response) {
    return document.getElementById(request).innerHTML = response;
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
var f = "1234567890";
function insertTask(nombre, apellido, cedula, fecha_nacimiento, direccion, celular) {
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
        inHTML("loadTable", "");
        insertTask(nombre, apellido, cedula, fecha_nacimiento, direccion, celular);
        asignation("nombre", "");
        asignation("apellido", "");
        asignation("cedula", "");
        asignation("direccion", "");
        asignation("celular", "");
        asignation("fecha_nacimiento", "");
        alert("saved successfully");
    }
}




