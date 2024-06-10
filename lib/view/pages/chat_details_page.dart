import 'dart:math';

import 'package:chat_using_websocket/core/utils/dynamic_sizes.dart';
import 'package:flutter/material.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: context.screenHeight(70),
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(right: context.screenWidth(20)),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.chevron_left_sharp,
                      size: context.screenWidth(40),
                    ),),),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO fetch user name and online status
                Text(
                  'amal',
                ),
                Text(
                  'online',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.screenWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: context.screenWidth(15)),
              child: Container(
                width: max(0, context.screenWidth(300)),
                padding: EdgeInsets.all(context.screenWidth(10)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(context.screenHeight(20)),
                        topLeft: Radius.circular(context.screenHeight(20)),
                        topRight: Radius.circular(context.screenHeight(20))),
                    color: Colors.grey),
                // recevied message
                child: Text(
                  'messageafasfnajfhkhbnvnbvnbnbjhbjjhbjh',
                ),
              ),
            ),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      left: context.screenWidth(15),
                      top: context.screenWidth(15)),
                  child: Container(
                    width: max(0, context.screenWidth(300)),
                    padding: EdgeInsets.all(context.screenWidth(10)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight:
                                Radius.circular(context.screenHeight(20)),
                            topLeft: Radius.circular(context.screenHeight(20)),
                            topRight:
                                Radius.circular(context.screenHeight(20))),
                        color: Colors.grey),
                    // recevied message
                    child: Text(
                      'messageafasfnajfhkhbnvnbvnbnbjhbjjhbjh',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: context.screenHeight(10)),
              child: TextField(
                // controller: controller,
                decoration: InputDecoration(
                  hintText: "Enter your text",
                  // hintStyle: context.typography.body,
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius:
                        BorderRadius.circular(context.screenHeight(20)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius:
                        BorderRadius.circular(context.screenHeight(20)),
                  ),

                  prefix: SizedBox(
                    width: 10,
                  ),
                  // sent button
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(context.screenHeight(10)),
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Transform.rotate(
                        angle: context.screenHeight(26.5),
                        child: IconButton(
                          onPressed: () {
                            // TODO fucton for sent messsage
                          },
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
            )
          ],
        ),
      ),
    );
  }
}
