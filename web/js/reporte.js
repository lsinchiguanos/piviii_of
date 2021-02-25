/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global cont, firebase, html2pdf */
var db = firebase.database();

function getRecordatorio() {
    eliminarFila();
    let arrayKeysUser = [];
    let objStructura;
    var user = firebase.auth().currentUser;
    var f = user.uid;
    let mac = document.getElementById("txtMac").value;
    db.ref('datos/recordatorios/' + mac).once('value').then((snapshot) => {
        objStructura = (snapshot.val());
        arrayKeysUser = Object.keys(objStructura);
        console.log(arrayKeysUser.length);
        console.log(snapshot.val());
        for (let i = 0; i < arrayKeysUser.length; i++) {
            getRecordatorios(mac, arrayKeysUser[i], i);
        }
    });
}
;

function getRecordatorios(mac, datoBuscar, i) {
    db.ref('datos/recordatorios/' + mac + '/' + datoBuscar).once('value').then((snapshot) => {
        console.log(snapshot.val().fecha);
        console.log(snapshot.val().hora);
        console.log(snapshot.val().estado);
        console.log(snapshot.val().mensaje);
        console.log('');
        $("#contentTable > tbody").append('<tr><th scope="row">' + (i + 1) + '</th><td>' + snapshot.val().fecha + '</td><td>' + snapshot.val().hora + '</td><td>' + snapshot.val().mensaje + '</td><td>' + snapshot.val().estado + '</td></tr>');
    });
}
;

function eliminarFila() {
    $('#contentTable tbody tr').remove();
}
;

function getPDF() {
    const invoice = this.document.getElementById("invoice");
    console.log(invoice);
    console.log(window);
    html2pdf().from(invoice).save();
}
;