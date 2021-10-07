import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class AddPhotoScreen extends StatelessWidget {
  static const routeName = 'AddPhotoScreen'; // route name

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  child: Image(
                    image: AssetImage('images/profile.png'),
                  ),
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.3,
                ),
              ),
              Text(
                "Start by adding\nyour profile\nphoto!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    wordSpacing: 1.5),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 270,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "Add photo",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              Text("(It\'s not working yet\nClick Skip)", style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,)
            ],
          ),
          Positioned(
              right: 25.0,
              bottom: 25.0,
              child: GestureDetector(
                onTap: (){Navigator.pushNamed(context, ChatScreen.routeName );},
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                ),
              ))
        ],
      ),
    );
  }
}
