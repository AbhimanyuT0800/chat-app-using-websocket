import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SentMessageTextFieldWidget extends ConsumerWidget {
  const SentMessageTextFieldWidget({
    Key? key,
    required this.textController,
    required this.onTap,
  }) : super(key: key);

  final TextEditingController textController;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight(10),
        bottom: context.screenHeight(20),
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: "Enter your text",
          hintStyle: context.typography.body,
          contentPadding:
              EdgeInsets.symmetric(vertical: context.screenHeight(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColorPalettes.black500),
            borderRadius: BorderRadius.circular(context.screenHeight(20)),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(context.screenHeight(20)),
          ),
          prefix: const SizedBox(
            width: 10,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(context.screenHeight(10)),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: IconButton(
                /// sent messages
                onPressed: onTap,
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
    );
  }
}
