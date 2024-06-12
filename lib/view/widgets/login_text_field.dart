import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(context.screenHeight(15)))),
          focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(context.screenHeight(15))),
              borderSide: const BorderSide(
                color: AppColorPalettes.blue,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(context.screenHeight(15))),
              borderSide: const BorderSide(color: AppColorPalettes.red500))),
    );
  }
}
