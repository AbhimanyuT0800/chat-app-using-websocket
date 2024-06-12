import 'package:chat_using_websocket/core/exception/base_exception/base_exception.dart';

class FirestoreException extends BaseException {
  String? error;
  FirestoreException({
    this.error,
    String? message,
  }) : super(message: error ?? 'Unknown Exception');
}
