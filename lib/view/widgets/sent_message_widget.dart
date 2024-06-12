import 'dart:math';

import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
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
                    bottomLeft: Radius.circular(context.screenHeight(20)),
                    topLeft: Radius.circular(context.screenHeight(20)),
                    topRight: Radius.circular(context.screenHeight(20))),
                color: AppColorPalettes.white100),
            // Sent message
            child: Text(
              message,
              style: context.typography.body,
            ),
          ),
        ),
      ],
    );
  }
}
