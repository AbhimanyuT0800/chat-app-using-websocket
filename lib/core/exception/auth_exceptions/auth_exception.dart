import 'package:chat_using_websocket/core/exception/base_exception/base_exception.dart';

class AuthException extends BaseException {
  String? error;
  AuthException({
    this.error,
    String? message,
  }) : super(message: error ?? 'Unknown Exception');
}
