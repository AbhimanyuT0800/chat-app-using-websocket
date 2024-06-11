import 'package:chat_using_websocket/demo/home_demo.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  // final WebSocketChannel channel =
  //     WebSocketChannel.connect(Uri.parse('https://echo.websocket.org/'));
  // await channel.ready;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePageDemo(
            channel: IOWebSocketChannel.connect('ws://echo.websocket.org/')));
  }
}
