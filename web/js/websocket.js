/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global websocket */

var connection = new WebSocket('ws://192.168.100.15:81/');

connection.onopen = function () {
    console.log('Connected: ' + window.location.host);

};

connection.onerror = function (error) {
    console.log('WebSocket Error ', error);
};

connection.onmessage = function (e) {
    console.log(e.data);
    $.ajax({
        type: "POST",
        url: 'consulta?a=' + e.data,
        data: {jdk: 56},
        success: function (data) {
            if (data.length > 0) {
                connection.send(data);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("jqXHR : " + jqXHR + " text status : " + textStatus + " error : " + errorThrown);
        }
    });
    // connection.send("alv");
};

connection.onclose = function () {
    websocket.close();
    console.log('WebSocket connection closed');
    location.reload();
};