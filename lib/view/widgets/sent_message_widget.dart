import 'dart:math';

import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:flutter/material.dart';

class SentMessageWidget extends StatelessWidget {
  const SentMessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
              left: context.screenWidth(15), top: context.screenWidth(15)),
          child: Container(
            width: max(0, context.screenWidth(300)),
            padding: EdgeInsets.all(context.screenWidth(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(context.screenHeight(20)),
                    topLeft: Radius.circular(context.screenHeight(20)),
                    topRight: Radius.circular(context.screenHeight(20))),
                color: Colors.grey),
            // Sent message
            child: Text(
              message,
            ),
          ),
        ),
      ],
    );
  }
}
