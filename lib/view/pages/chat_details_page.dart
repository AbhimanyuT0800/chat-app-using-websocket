import 'dart:math';

import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:chat_using_websocket/view/widgets/recived_message_widget.dart';
import 'package:chat_using_websocket/view/widgets/sent_message_widget.dart';
import 'package:flutter/material.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller for input message
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: context.screenHeight(70),
        backgroundColor: AppColorPalettes.blue,
        centerTitle: true,
        title: Text(
          'Chat Room',
          style: context.typography.h2SemiBold
              .copyWith(color: AppColorPalettes.white500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenHeight(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            // Recived message
            RecivedMessageWidget(
              message: 'asasdad',
            ),
            SentMessageWidget(
              message: 'ads',
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: context.screenHeight(10),
                  bottom: context.screenHeight(20)),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Enter your text",
                  hintStyle: context.typography.body,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: context.screenHeight(20)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColorPalettes.black500),
                    borderRadius:
                        BorderRadius.circular(context.screenHeight(20)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius:
                        BorderRadius.circular(context.screenHeight(20)),
                  ),

                  prefix: SizedBox(
                    width: 10,
                  ),
                  // sent button
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(context.screenHeight(10)),
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Transform.rotate(
                        angle: context.screenHeight(26.5),
                        child: IconButton(
                          onPressed: () {
                            // TODO fucton for sent messsage
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.amber,
                            size: context.screenHeight(27),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
