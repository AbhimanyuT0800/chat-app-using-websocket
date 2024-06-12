import 'dart:convert';

// model for messaging
class MessageModel {
  final String msg;
  final String sender;
  final int timestamp;

  MessageModel({
    required this.msg,
    required this.sender,
    required this.timestamp,
  });

  // Convert a MessageModel into a Map.
  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'msg': msg,
        'sender': sender,
      };

  // Create a MessageModel from a Map.
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      msg: json['msg'],
      sender: json['sender'],
      timestamp: json['timestamp'],
    );
  }

  // Helper method to convert JSON string to MessageModel.
  factory MessageModel.fromJsonString(String jsonString) {
    return MessageModel.fromJson(json.decode(jsonString));
  }

  // Helper method to convert MessageModel to JSON string.
  String toJsonString() {
    return json.encode(toJson());
  }
}
