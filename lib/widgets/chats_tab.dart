import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chat/model/users.dart';
import 'package:chat/screens/chat_screen.dart';

class ChatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(right: 15, left: 7),
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: user.length,
          itemBuilder: (context, index) {
//            final Message chat = chats[index];

            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 25),
              child: Column(
                children: <Widget>[

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
//                          users: chat.sender,
                        ),
                      ),
                    ),
                    child: Container(
                      width: screenWidth,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 20, top: 20),
                                width: 70,
                                height: 70,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: (user[index].seenMsgs == true)
                                      ? new Border.all(
                                      width: 3.0,
                                      style: BorderStyle.solid,
                                      color: Colors.blueAccent)
                                      : Border.all(
                                    color: Colors.white,
                                    width: 0,
                                  ),
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(user[index].dp),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 48,
                                top: 22,
                                child: (user[index].seenMsgs == true)
                                    ? Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      '${user[index].unreadMsgs}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                                    : Container(),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  user[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  user[index].msg,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: user[index].seenMsgs == true
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: user[index].seenMsgs == true
                                        ? Colors.blueAccent
                                        : Colors.transparent,
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  user[index].status,
                                  maxLines: 1,
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade100,
                    thickness: 2,
                    indent: 107,
                    endIndent: 15,
                  ),
                ],
              ),
            );
          },),
    );
  }
}
