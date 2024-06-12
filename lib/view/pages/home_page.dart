import 'dart:developer';

import 'package:chat_using_websocket/controller/auth/get_users_provider.dart';
import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:chat_using_websocket/services/auth_services.dart';
import 'package:chat_using_websocket/view/pages/chat_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// chat list home page
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AuthServices.userLogOut();
              },
              icon: Icon(Icons.logout)),
          title: const Text(
            'Chat',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: ref.watch(getAllUsersProvider).when(
              data: (data) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.screenWidth(8)),
                  child: ListView.builder(
                    itemCount: data.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final userData = data.docs[index].data();
                      log('xdsfdgh');
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(context.screenWidth(10))),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailsPage(
                                  reciverId: userData['name'],
                                ),
                              ),
                            );
                          },
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            userData['name'],
                          ),
                          subtitle: Text(
                            userData['email'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
