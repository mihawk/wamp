addEventListener("message", function(e){
    var msg = e.data;
    var c = msg['content'];
    switch ( msg['type']){
        case "login":
            connect(c['server'], c['port']);
            break;
        case "auth":
            login(c['user'], c['pass']);
            break;
        case "info":
            break;
        default:
            notify("WTF?: " + msg);
    }
});

var ws =  null;
function login(user, password){
    var msg2 = {};
    msg2['type'] = "auth";
    msg2['body'] = {};
    msg2['body']['user'] = user;
    msg2['body']['pass'] = password;    
    toServer(msg2);
}

function toServer(msg){
    ws.send(JSON.stringify(msg));
}

function connect(server, port){
    notify("Conecting to " + server + ":" + port);
    ws = new WebSocket('ws://' + server + ":" + port +'/wsftp');    
    ws.onopen = function() { 
        notify("Connected");
    };
    ws.onclose = function() {
        notify("Closed");
    };
    ws.onmessage = function(msg) { 
        notify( msg.data);
    };
}
   
function notify(msg){
    postMessage(msg);
}