import 'dart:math';

import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:flutter/material.dart';

class RecivedMessageWidget extends StatelessWidget {
  const RecivedMessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: max(0, context.screenWidth(300)),
      padding: EdgeInsets.all(context.screenWidth(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(context.screenHeight(20)),
              topLeft: Radius.circular(context.screenHeight(20)),
              topRight: Radius.circular(context.screenHeight(20))),
          color: Colors.grey),
      // recevied message
      child: Text(
        message,
      ),
    );
  }
}
