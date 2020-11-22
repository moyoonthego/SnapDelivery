import 'dart:io';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:app/styles/constants.dart' as Constants;

// THIS PAGE IS A WIP!!!!

// Messages page for an individual order thread
class MessagePage extends StatefulWidget {
  final String username;
  final String uuid;

  MessagePage({this.username, this.uuid});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // assign role for user 1 and user 2
  ChatUser user2 = ChatUser(
      name: "McDonalds",
      avatar: "https://images.safe.com/logos/customers/mcdonalds.png");
  ChatUser user = ChatUser(firstName: "Moe", lastName: "Ali");

  @override
  void initState() {
    user.name = widget.username;
    user.uid = widget.uuid;
    super.initState();
  }

  void onSend(ChatMessage message) {}

  @override
  Widget build(BuildContext context) {
    // chain of messages
    var messages = [
      ChatMessage(user: user2, text: "I'm outside!"),
      ChatMessage(user: user, text: "Ok thanks!")
    ];

    return Theme(
        // chat stylings
        data: ThemeData(
            splashColor: Colors.transparent,
            primarySwatch: Constants.MATERIAL_BLUE,
            fontFamily: "Euclid Circular B"),
        child: Scaffold(
          appBar: AppBar(
            // return button
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Constants.YELLOW),
              onPressed: () => Navigator.of(context).pop(),
            ),
            // more options button
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Constants.DARKGRAY,
                ),
                onPressed: () {
                  // add small dropdown for delete chat, view order, view store
                },
              )
            ],
            // Page header
            title: Text("ORDER #EF153K", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          // actual chat messages (using DashChat component)
          body: DashChat(
            user: user,
            messages: messages,
            inputDecoration: InputDecoration(
              hintText: "  Send Message",
              border: InputBorder.none,
            ),
            onSend: onSend,
          ),
        ));
  }
}
