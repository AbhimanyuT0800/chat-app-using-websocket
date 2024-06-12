import 'dart:math';

import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:chat_using_websocket/demo/model.dart';
import 'package:flutter/material.dart';

class RecivedMessageWidget extends StatelessWidget {
  const RecivedMessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: max(0, context.screenWidth(300)),
          padding: EdgeInsets.all(context.screenWidth(10)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(context.screenHeight(20)),
                  topLeft: Radius.circular(context.screenHeight(20)),
                  topRight: Radius.circular(context.screenHeight(20))),
              color: AppColorPalettes.white100),
          // recevied message
          child: Text(
            message.msg,
            style: context.typography.bodyLarge,
          ),
        ),
        Text(
          message.sender,
          style: context.typography.body,
        )
      ],
    );
  }
}
