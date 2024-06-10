import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter Your Phone Number',
            style: TextStyle(
              fontSize: context.screenHeight(30),
              fontWeight: FontWeight.w600,
            ),
          ),
          // IntlPhoneField()
          IntlPhoneField(
            controller: phoneNumberController,
            initialCountryCode: 'IN',
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: '000',
              contentPadding: EdgeInsets.only(
                bottom: context.screenHeight(30),
              ),
            ),
            onCountryChanged: (country) {
              // add country code
              // ref.read(coutryCodeProvider.notifier).state =
              //     '+${country.dialCode}';
            },
          ),
        ],
      ),
    );
  }
}
