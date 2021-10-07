import 'package:chat/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = 'welcomeScreen'; // route name

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),color: Colors.blueAccent),
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                  size: 50,
                )),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'Simple. Secure.',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Reliable messaging.',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.25,
          ),
          Material(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RegistrationScreen.routeName);
              },
              minWidth: screenWidth * 0.8,
              height: screenHeight * 0.085,
              child: Text(
                'AGREE AND CONTINUE',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Read our ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: textSize * 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy. ',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: textSize * 15,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Tap "Agree" to accept\n                     the ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: textSize * 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service. ',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: textSize * 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
