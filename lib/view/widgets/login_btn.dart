import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  final Function() onTap;
  final String btnTxt;

  const LoginBtn({
    Key? key,
    required this.onTap,
    required this.btnTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColorPalettes.blue,
        textStyle: context.typography.bodyLargeSemiBold,
        minimumSize: Size(
          double.infinity,
          context.screenHeight(56),
        ),
      ),
      onPressed: onTap,
      child: Text(btnTxt),
    );
  }
}
