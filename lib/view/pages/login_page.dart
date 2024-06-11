import 'package:chat_using_websocket/controller/auth/auth_provider.dart';
import 'package:chat_using_websocket/core/constants/log_sigin_constants.dart';
import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:chat_using_websocket/services/auth_services.dart';
import 'package:chat_using_websocket/view/widgets/login_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // check is login or sigin
    final isLogin = useState<bool>(false);
    // email controller
    final TextEditingController emailController = useTextEditingController();
    // name controller
    final TextEditingController nameController = useTextEditingController();
    // password controller
    final TextEditingController passController = useTextEditingController();
    // constants login and signin
    final loginConsts = ref.read(logSiginConstantsProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth(18)),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // title text
              const Spacer(
                flex: 4,
              ),
              Text(
                loginConsts.txtTitleLogin,
                style: context.typography.h1Bold,
              ),
              const Spacer(
                flex: 1,
              ),
              // email text field
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: context.screenHeight(18)),
                child: AppTextField(
                    label: 'Email',
                    controller: emailController,
                    hintText: loginConsts.txtHintEmail),
              ),
              // name text field
              // checks is login or not
              isLogin.value
                  ? const SizedBox.shrink()
                  : AppTextField(
                      controller: nameController,
                      hintText: loginConsts.txtHintName,
                      label: 'Name'),
              // password text field
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: context.screenHeight(18)),
                child: AppTextField(
                    controller: passController,
                    hintText: loginConsts.txtHintPass,
                    label: 'Password'),
              ),
              const Spacer(
                flex: 1,
              ),
              LoginBtn(
                  onTap: () {
                    isLogin.value
                        ? ref.watch(authStateProvider.notifier).logInwithEmail(
                            context: context,
                            email: emailController.text,
                            pass: passController.text)
                        : ref.watch(authStateProvider.notifier).signInWithEmail(
                            context: context,
                            email: emailController.text,
                            pass: passController.text,
                            userName: nameController.text);
                  },
                  btnTxt: isLogin.value
                      ? loginConsts.txtLogin
                      : loginConsts.txtSignin),
              InkWell(
                // change login or sign in
                onTap: () {
                  isLogin.value = !isLogin.value;
                },
                child: Text(
                  !isLogin.value
                      ? loginConsts.txtAlreadySign
                      : loginConsts.txtCreateAc,
                  style: context.typography.body,
                ),
              ),
              const Spacer(
                flex: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
