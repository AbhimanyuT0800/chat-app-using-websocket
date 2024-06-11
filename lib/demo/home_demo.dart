import 'dart:developer';

import 'package:chat_using_websocket/demo/model.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePageDemo extends StatefulWidget {
  const HomePageDemo({Key? key, required this.channel}) : super(key: key);
  final WebSocketChannel channel;

  @override
  State<HomePageDemo> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDemo> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter...'),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: StreamBuilder(
                  stream: widget.channel.stream,
                  builder: (context, snapshot) {
                    log('stream');
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              widget.channel.sink.add(ChatModel(msg: controller.text));
              log('fl fn');
            }
          },
          label: Text('Add')),
    );
  }
}
