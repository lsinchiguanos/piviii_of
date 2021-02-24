/* global firebase */

function cerrar() {
    firebase.auth().signOut()
            .then(function () {
                alert("sesion cerrada");
                window.location.replace('index.jsp');
            })
            .catch(function (error) {
                console.log(error);
            });
}