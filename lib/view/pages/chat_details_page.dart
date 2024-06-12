import 'dart:developer';

import 'package:chat_using_websocket/controller/firestore/fire_store_provider.dart';
import 'package:chat_using_websocket/controller/firestore/get_message_provider.dart';
import 'package:chat_using_websocket/controller/websocket/websocket_channel_provider.dart';
import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:chat_using_websocket/demo/model.dart';
import 'package:chat_using_websocket/services/auth_services.dart';
import 'package:chat_using_websocket/view/widgets/sent_message_text_field_widget.dart';
import 'package:chat_using_websocket/view/widgets/recived_message_widget.dart';
import 'package:chat_using_websocket/view/widgets/sent_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// chat details page
class ChatDetailsPage extends ConsumerStatefulWidget {
  const ChatDetailsPage({Key? key, required this.reciverId}) : super(key: key);
// other user id for texting
  final String reciverId;

  @override
  ChatDetailsPageState createState() => ChatDetailsPageState();
}

class ChatDetailsPageState extends ConsumerState<ChatDetailsPage> {
  final TextEditingController textController = TextEditingController();
  final List<MessageModel> _messages = [];

  @override
  Widget build(BuildContext context) {
    // socket channel
    final channel = ref.watch(webSocketChannelProvider);
    // current user
    final user = AuthServices.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColorPalettes.white500,
            )),
        toolbarHeight: context.screenHeight(70),
        backgroundColor: AppColorPalettes.blue,
        title: Text(
          // title as other user
          widget.reciverId,
          style: context.typography.h2SemiBold
              .copyWith(color: AppColorPalettes.white500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenHeight(16)),
        child: Column(
          children: [
            Expanded(
              // stream builder for fetch data from socket channel
              child: StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    if (data is String) {
                      try {
                        // covert to message model
                        final message = MessageModel.fromJsonString(data);
                        setState(() {
                          //model added to the list
                          _messages.add(message);
                        });
                      } catch (e) {
                        log('Error parsing message: $e');
                      }
                    }
                  } else if (snapshot.hasError) {
                    log('Error: ${snapshot.error}');
                  }

                  return ref.watch(getAllMessagesProvider).when(
                        data: (data) {
                          // firestore message added to the list
                          final firestoreMessages = data.docs.map((doc) {
                            return MessageModel(
                              msg: doc.data().message,
                              sender: doc.data().sender,
                              timestamp: doc.data().timestamp,
                            );
                          }).toList();
                          // combine both message and sort using time stamp
                          var combinedMessages = [
                            ...firestoreMessages,
                            ..._messages,
                          ]..sort((a, b) => a.timestamp.compareTo(b.timestamp));
                          // set the list for remove duplication
                          combinedMessages = combinedMessages.toSet().toList();
                          return ListView.builder(
                            itemCount: combinedMessages.length,
                            itemBuilder: (context, index) {
                              final message = combinedMessages[index];
                              // current user id and messge sender id smae return sentmessage widget
                              return user?.displayName == message.sender
                                  ? SentMessageWidget(message: message.msg)
                                  // or sender id and reciver id same recive widget
                                  : message.sender == widget.reciverId
                                      ? RecivedMessageWidget(message: message)
                                      : const SizedBox.shrink();
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          return const Center(
                              child: Text('Error loading messages'));
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                      );
                },
              ),
            ),
            // sent message text field
            SentMessageTextFieldWidget(
              textController: textController,
              onTap: () {
                log('ererror');
                try {
                  // create message model
                  final message = MessageModel(
                    msg: textController.text,
                    sender: user?.displayName ?? 'unknown',
                    timestamp:
                        DateTime.now().millisecondsSinceEpoch, // Add timestamp
                  );
                  // call sent message to firestore
                  ref
                      .watch(appFireStoreProvider.notifier)
                      .sentMessage(model: message, context: context);
                  // sent model to socket api
                  channel.sink.add(message.toJsonString());
                  // clear text controller
                  textController.clear();
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
