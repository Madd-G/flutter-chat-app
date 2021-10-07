import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/components/rounded_button.dart';
import 'package:chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  bool isHidden = true;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Create \nAccount',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 50,
                    fontWeight: FontWeight.w700),
              ),
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
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Register',
                  colour: Colors.blueAccent,
                  onPressed: () async {
                    setState(
                          () {
                        showSpinner = true;
                      },
                    );
                    try {
                      final newUser =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null)
                        Navigator.pushNamed(
                            context, VerificationScreen.routeName);
                      setState(
                            () {
                          showSpinner = false;
                        },
                      );
                    } catch (e) {
                      print(e);
                    } finally {
                      setState(
                            () {
                          showSpinner = false;
                        },
                      );
                    }
                  }),
              Row(
                children: [
                  Text('Have an account?'),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  // alert box when email or password are empty
//  void _showMyDialogue() async {
//    return showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            content: Text(
//              'Account registered',
//              style: TextStyle(
//                fontSize: 18,
//                fontWeight: FontWeight.w600,
//              ),
//            ),
//            actions: <Widget>[
//              FlatButton(
//                onPressed: () => Navigator.pop(context),
//                child: Text(
//                  'OK',
//                  style: TextStyle(
//                    fontSize: 18,
//                    color: Colors.blueAccent,
//                    fontWeight: FontWeight.w600,
//                  ),
//                ),
//              ),
//            ],
//          );
//        });
//  }
//}
//}

//Flexible(
//child: Hero(
//tag: 'logo',
//child: Container(
//height: 200.0,
//child: Image.asset('images/logo.png'),
//),
//),
//),
