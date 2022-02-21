import 'package:chat/screens/home_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/components/rounded_button.dart';
import 'package:chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool showSpinner = false;

  String email;
  String password;

  bool isHidden = true;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

//  final _auth = FirebaseAuth.instance;

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                SafeArea(
                  child: Center(
                    child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 1000),
                      totalRepeatCount: 3,
                      text: ['Welcome Back'],
                      textStyle: TextStyle(
                          fontSize: 50,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
//              Row(
//                children: <Widget>[
//                  Hero(
//                    tag: 'logo',
//                    child: Container(
//                      child: Image.asset('images/logo.png'),
//                      height: 60.0,
//                    ),
//                  ),
//                  TypewriterAnimatedTextKit(
//                    speed: Duration(seconds: 1),
//                    text: ['Flash Chat'],
//                    textStyle: TextStyle(
//                      fontSize: 45.0,
//                      fontWeight: FontWeight.w900,
//                    ),
//                  ),
//                ],
//              ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Email address'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: isHidden ? true : false,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: toggleVisibility,
                      child: Icon(isHidden == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 220.0, top: 7.0),
                    child: Text(
                      'forgot your password',
                      style: TextStyle(color: Colors.grey[500]),
                    )),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: Colors.blueAccent,
                  onPressed: () async {
                    setState(
                      () {
                        showSpinner = true;
                      },
                    );
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email, password: password);
                      await Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    } catch (e) {
                      print(e);
                    } finally {
                      setState(
                        () {
                          showSpinner = false;
                        },
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    Text('Dont have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegistrationScreen.routeName);
                      },
                      child: Text(
                        'Create',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
