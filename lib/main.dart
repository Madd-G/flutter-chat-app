import 'package:chat/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:chat/screens/add_photo_screen.dart';
import 'package:chat/screens/welcome_screen.dart';
import 'package:chat/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//        theme: ThemeData.light().copyWith(
//          scaffoldBackgroundColor: Colors.transparent,
//          textTheme: TextTheme(
//            bodyText2: TextStyle(color: Colors.black),
//        ),
      initialRoute: LoginScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
        VerificationScreen.routeName: (context) => VerificationScreen(),
        AddPhotoScreen.routeName: (context) => AddPhotoScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
      },
    );
  }
}
