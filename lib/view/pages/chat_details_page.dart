import 'dart:developer';

import 'package:chat_using_websocket/controller/firestore/fire_store_provider.dart';
import 'package:chat_using_websocket/controller/firestore/get_message_provider.dart';
import 'package:chat_using_websocket/controller/websocket/websocket_channel_provider.dart';
import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/app_theme.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:chat_using_websocket/demo/model.dart';
import 'package:chat_using_websocket/services/auth_services.dart';
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
        automaticallyImplyLeading: false,
        toolbarHeight: context.screenHeight(70),
        backgroundColor: AppColorPalettes.blue,
        centerTitle: true,
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
                          //
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
                          final firestoreMessages = data.docs.map((doc) {
                            return MessageModel(
                              msg: doc.data().message,
                              sender: doc.data().sender,
                              timestamp: doc.data().timestamp,
                            );
                          }).toList();

                          var combinedMessages = [
                            ...firestoreMessages,
                            ..._messages,
                          ]..sort((a, b) => a.timestamp.compareTo(b.timestamp));

                          combinedMessages = combinedMessages.toSet().toList();

                          return ListView.builder(
                            itemCount: combinedMessages.length,
                            itemBuilder: (context, index) {
                              final message = combinedMessages[index];
                              return user?.displayName == message.sender
                                  ? SentMessageWidget(message: message.msg)
                                  : message.sender == widget.reciverId
                                      ? RecivedMessageWidget(message: message)
                                      : null;
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
            SentMessageTextFieldWidget(
              textController: textController,
              onTap: () {
                log('ererror');
                try {
                  final message = MessageModel(
                    msg: textController.text,
                    sender: user?.displayName ?? 'unknown',
                    timestamp:
                        DateTime.now().millisecondsSinceEpoch, // Add timestamp
                  );
                  ref
                      .watch(appFireStoreProvider.notifier)
                      .sentMessage(model: message, context: context);
                  channel.sink.add(message.toJsonString());
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

class SentMessageTextFieldWidget extends ConsumerWidget {
  const SentMessageTextFieldWidget({
    Key? key,
    required this.textController,
    required this.onTap,
  }) : super(key: key);

  final TextEditingController textController;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight(10),
        bottom: context.screenHeight(20),
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: "Enter your text",
          hintStyle: context.typography.body,
          contentPadding:
              EdgeInsets.symmetric(vertical: context.screenHeight(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColorPalettes.black500),
            borderRadius: BorderRadius.circular(context.screenHeight(20)),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(context.screenHeight(20)),
          ),
          prefix: const SizedBox(
            width: 10,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(context.screenHeight(10)),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Transform.rotate(
                angle: context.screenHeight(26.5),
                child: IconButton(
                  /// sent messages
                  onPressed: onTap,
                  icon: Icon(
                    Icons.send,
                    color: Colors.amber,
                    size: context.screenHeight(27),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
