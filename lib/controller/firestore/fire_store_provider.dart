import 'package:chat_using_websocket/core/exception/base_exception/base_exception.dart';
import 'package:chat_using_websocket/demo/model.dart';
import 'package:chat_using_websocket/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fire_store_provider.g.dart';

// fire store provider
@riverpod
class AppFireStore extends _$AppFireStore {
  @override
  List<MessageModel> build() {
    return [];
  }

// Sent message method
  void sentMessage(
      {required MessageModel model, required BuildContext context}) async {
    try {
      FirestoreServices.chatAddToFireStore(model: model);
    } on BaseException catch (e) {
      Future.sync(
        () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message))),
      );
    }
  }

// recive message method
  Stream<List<MessageModel>> reciveMessage(
      {required MessageModel model, required BuildContext context}) async* {
    List<MessageModel> allData = [];
    try {
      final data = FirestoreServices.getAllChats();
      data.listen(
        (event) {
          for (var element in event.docs) {
            final MessageModel model = MessageModel(
                timestamp: element.data().timestamp,
                msg: element.data().message,
                sender: element.data().sender);
            state.add(model);
            allData.add(model);
          }
        },
      );
      yield allData;
    } on BaseException catch (e) {
      Future.sync(
        () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message))),
      );
    }
  }
}
