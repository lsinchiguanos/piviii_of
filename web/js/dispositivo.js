/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global firebase */

var db = firebase.database();
var banderaDispositivo = 0;

/* Función para obtener todos los usuarios */
function getUsuariosPacientes() {
    let arrayKeysUser = [];
    let objStructura;
    var user = firebase.auth().currentUser;
    var f = user.uid;
    db.ref('registro/' + f).once('value').then((snapshot) => {
        objStructura = (snapshot.val());
        arrayKeysUser = Object.keys(objStructura);
        for (let i = 0; i < arrayKeysUser.length; i++) {
            getDatosPaciente(arrayKeysUser[i]);
        }
    });
}
;

function getDatosPaciente(datoBuscar) {
    db.ref('usuario/' + datoBuscar).once('value').then((snapshot) => {
        var $newOpt = $("<option>").attr("value", datoBuscar).text(snapshot.val().cedula + " - " + snapshot.val().apellido + " " + snapshot.val().nombre);
        $("#pacienteDispositivo").append($newOpt);
        $("#pacienteDispositivo").trigger('contentChanged');
    });
}
;

function clearModalDispositivo() {
    $('#alias').val("");
    $('#mac').val("");
    $('#pacienteDispositivo').empty();

}
;

function main() {
    $('#pacienteDispositivo').formSelect();
    $('#pacienteDispositivo').on('contentChanged', function () {
        $(this).formSelect();
    });
    clearModalDispositivo();
    getUsuariosPacientes();

}
;

$("#btnaggdatosDispositivo").on("click", function () {
    agregarDispositivo();
});

function agregarDispositivo() {
    let iddispositivo = firebase.database().ref("dispositivos").push().getKey();
    let idpaciente = $("#pacienteDispositivo").val();
    let mac = $('#mac').val();
    let alias = $('#alias').val();
    validacionDispositivo(mac, alias, idpaciente);
    if (banderaDispositivo === 0) {
        banderaDispositivo = 0;
        firebase.database().ref('dispositivos/' + iddispositivo).set({
            alias: alias,
            mac: mac,
            paciente: idpaciente
        });
        alert('Dispositivo registrado exitosamente');
    }
    $('#modalDispositivo').modal('toggle');
}
;

function validacionDispositivo(mac, alias, paciente) {
    let arrayValuesDispositivo = [];
    let objStructura;
    db.ref('dispositivos').once('value').then((snapshot) => {
        objStructura = (snapshot.val());
        arrayValuesDispositivo = Object.values(objStructura);
        let i = 0;
        while (i < arrayValuesDispositivo.length) {
            if (arrayValuesDispositivo[i].paciente === paciente) {
                if (arrayValuesDispositivo[i].mac === mac) {
                    alert('Mac ya existente para el actual usuario');
                    banderaDispositivo = 1;
                    break;
                }
                if (arrayValuesDispositivo[i].alias === alias) {
                    alert('Alias ya existente para el actual usuario');
                    banderaDispositivo = 1;
                    break;
                }
            } else if (arrayValuesDispositivo[i].mac === mac) {
                alert('Mac ya existente');
                banderaDispositivo = 1;
                break;
            }
            i++;
        }
    });
}
;