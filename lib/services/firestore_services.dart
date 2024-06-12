import 'package:chat_using_websocket/core/exception/firestore_exception/firestore_exception.dart';
import 'package:chat_using_websocket/demo/model.dart';
import 'package:chat_using_websocket/model/message_firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static final db = FirebaseFirestore.instance;

// add new chat to firestore
  static void chatAddToFireStore({required MessageModel model}) async {
    final MessageFirestoreModel firestoreModel = MessageFirestoreModel(
        message: model.msg, sender: model.sender, timestamp: model.timestamp);
    try {
      db
          .collection('global-chat')
          .withConverter(
              fromFirestore: MessageFirestoreModel.fromFirestore,
              toFirestore: MessageFirestoreModel.toFirestore)
          .add(firestoreModel);
    } on FirebaseException catch (e) {
      throw FirestoreException(error: e.message);
    }
  }

// get all message from fire store
  static Stream<QuerySnapshot<MessageFirestoreModel>> getAllChats() {
    try {
      return db
          .collection('global-chat')
          .withConverter(
              fromFirestore: MessageFirestoreModel.fromFirestore,
              toFirestore: MessageFirestoreModel.toFirestore)
          .snapshots();
    } on FirebaseException catch (e) {
      throw FirestoreException(error: e.message);
    }
  }

  static void addUserToFirestore(
      {required String name, required String email}) async {
    try {
      await db
          .collection('users')
          .doc(name)
          .set({'name': name, 'email': email});
    } on FirebaseException catch (e) {
      throw FirestoreException(error: e.message);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    try {
      return db.collection('users').snapshots();
    } on FirebaseException catch (e) {
      throw FirestoreException(error: e.message);
    }
  }
}
