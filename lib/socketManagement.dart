import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart' as IO;

// IO.Socket socket;

// class Socket {
//   void Connect() {
//     socket = IO.io(
//         '${host}', IO.OptionBuilder().setTransports(['websocket']).build()); //

//     socket.onConnect((_) {
//       print('connect to host ${host}');
//       socket.emit('connection', 'connect');
//       // socket.emit('message', 'connected');
//       socket.disconnect();
//     });
//     // socket.on('message', (data) => print("data from font: $data"));
//     // socket.onDisconnect((_) => print('web socket disconnect'));
//   }

//   void checkConnecttion(Function want_run) {
//     socket.onConnect((_) {
//       want_run();
//     });
//   }

//   void Emit(String topic, String message) {
//     socket.emit('${topic}', '${message}');
//   }

// //String _topic, Function callback
//   void SubScript(String _topic, Function callback(String _message)) {
//     // print("Backend check");
//     IO.Socket _socket = IO.io(
//         '${host}', IO.OptionBuilder().setTransports(['websocket']).build());
//     _socket.onConnect((_) {
//       // print('connect back');
//       // _socket.emit('msg', 'test');
//     });
//     _socket.on('$_topic', (data) => callback(data));
//     // _socket.onDisconnect((_) => print('disconnect'));
//     // socket.on('fromServer', (_) => print(_));
//   }
// }

// // Function callback(String message){}
// void initSocket() async {
//   print("init socket");
//   Socket socket = Socket();
//   // socket.setHost("http://localhost"); //192.168.137.1
//   // socket.setPort("7000");
//   // socket.Connect();
// }
String host = "https://bypass4-scb-callback.herokuapp.com/";

class SocketManagement {
  void emit(String _topic, String _message) {
    IO.Socket socket = IO.io(
        '${host}', IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print('connect to ${host}  ref ${_topic}');
      socket.emit('${_topic}', '${_message}');
      socket.disconnect();
    });

    socket.onDisconnect((data) => print("disconnect"));
  }

  void subscript(String _topic, Function _fun) {
    IO.Socket socket = IO.io(
        '${host}', IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print('connect to ${host}  ref :${_topic}');
      // _socket.emit('msg', 'test');
    });
    socket.on('$_topic', (data) => _fun(data));
  }
}
