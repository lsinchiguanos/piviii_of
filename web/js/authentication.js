/* global firebase */

//INGRESAR A LA APLICACIÓN
var btnLogin = document.getElementById('btnLogin');
var inputEmail = document.getElementById('inputEmail');
var inputPassword = document.getElementById('inputPassword');


btnLogin.addEventListener('click', function () {

    firebase.auth().signInWithEmailAndPassword(inputEmail.value, inputPassword.value).then(function (result) {
        alert("Usuario Conectado!");
//        var user = firebase.auth().currentUser;
//        var f = user.uid;
//        console.log(f);
        window.location.replace('Principal.jsp');
    }).catch(function (error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        alert("Datos incorrectos");
    });
});

