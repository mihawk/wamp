$(document).ready(function(){
    window.requestFileSystem  = window.requestFileSystem || window.webkitRequestFileSystem;    
    var ws;
    var msg2 = {};
    var socketHandler = new Worker("SocketHandler.js");

    var  server = {
        'type': 'login', 
        'content' : {
            'server':'localhost',
            'port':8080
        }
    }

    var user = {
        'type':'auth', 
        'content': {
            'user': 'musti', 
            'pass' : 'buket'
        }
    };
        
    socketHandler.postMessage(server);    
    socketHandler.addEventListener("message", function(e){
        console.log("worker says: " + e.data);
        switch ( e.data){
            case "Connected":
                socketHandler.postMessage(user);
                break;
            default:
                console.log("OMG WHAT WAS THAT");
        }
    })
   
});