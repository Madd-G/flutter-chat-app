import 'package:chat/model/users.dart';
import 'package:flutter/material.dart';
import 'package:chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const routeName = 'Chat Screen';
  final Users users;

  ChatScreen({this.users});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  final _auth = FirebaseAuth.instance;
  String messageText;
  final messageTextController = TextEditingController();

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

//  void messageFuture() async {
//    final messages = await _firestore.collection('messages').get();
//    for(var message in messages.docs){
//      print(message.data());
//    }
//  }

//  void messagesStream() async {
//    await for (var snapshot in _firestore.collection('messages').snapshots()) {
//      for (var message in snapshot.docs) {
//        print(message.data());
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color(0xFFEFF0F4),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        flexibleSpace: Row(
          children: [
//            CircleAvatar(
//              backgroundImage: AssetImage(widget.users.name),
//            )
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
        title: Text(loggedInUser.email),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add(
                        {
                          'text': messageText,
                          'sender': loggedInUser.email,
                          'timestamp': FieldValue.serverTimestamp()
                        }, //or DateTime.now()  serverTimestamp()
                      );
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs;
        List<MessageBubble> messageWidgets = [];
        for (var message in messages) {
          // final messageData = message.data();
          final messageText = message['text'];
          final messageSender = message['sender'];
          final messageTime = message['timestamp'];

          final currentUser = loggedInUser.email;

          if (currentUser == messageSender) {}
          final messageBubbles = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
            time: messageTime,
          );
          messageWidgets.add(messageBubbles);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final Timestamp time;
  final bool isMe;

  MessageBubble({Key key, this.text, this.sender, this.isMe, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          isMe
              ? SizedBox()
              : Text(
                  sender,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Material(
              elevation: 2.0,
              color: isMe ? Colors.blueAccent : Colors.white,
              borderRadius: isMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0))
                  : BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 15, color: isMe ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
          Text(
            time.toDate().hour.toString() +
                ':' +
                time.toDate().minute.toString(),
            style: TextStyle(fontSize: 10.0),
          )
        ],
      ),
    );
  }
}
