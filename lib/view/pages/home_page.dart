import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:chat_using_websocket/view/pages/chat_details_page.dart';
import 'package:flutter/material.dart';

// chat list home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chat',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth(8)),
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(context.screenWidth(10))),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailsPage(),
                        ));
                  },
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: const Text(
                    'Name',
                  ),
                  subtitle: const Text(
                    'last msg',
                  ),
                ),
              );
            },
          ),
        ));
  }
}
