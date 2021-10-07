import 'package:chat/screens/add_photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = "Verification Screen";

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 25), vsync: this, upperBound: 25);
    controller.reverse(from: 25);

    controller.addListener(() {
      setState(() {
        print(controller.value);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blueAccent),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 50,
                        )),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Text(
                  'Verification',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  'We have sent you an Email with a code to the email that you provided.',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      autoDismissKeyboard: true,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                      ),
                      onChanged: (value) {
                        print('changed');
                      }),
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      'Resend code in ',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${controller.value.toInt()}',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      "Didn\'t receive code?",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Request again",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17.0),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 90),
                Center(
                  child: Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AddPhotoScreen.routeName,
                        );
                      },
                      minWidth: screenWidth * 0.8,
                      height: screenHeight * 0.085,
                      child: Text(
                        'Verify and Create Account',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
