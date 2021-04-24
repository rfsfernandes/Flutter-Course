import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  void authenticateUser() async {

    try {
      var authentication = await _auth.signInWithEmailAndPassword(email:
      email, password: password);
      print(authentication);
      if (authentication != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }

    } catch (e) {
      print('--------------------');
      print(e);
      print('--------------------');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: kLogoTag,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kTextFieldDecoration(
                      color: Colors.lightBlueAccent, hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  textAlign: TextAlign.center,
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: kTextFieldDecoration(
                      color: Colors.lightBlueAccent,
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  color: Colors.lightBlueAccent,
                  text: 'Log In',
                  callBack: () {
                    final progress = ProgressHUD.of(context);
                    progress.show();
                    authenticateUser();
                    Future.delayed(Duration(seconds: 1), () {
                      progress.dismiss();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
