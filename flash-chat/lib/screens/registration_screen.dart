import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  void initState() {
    super.initState();
  }

  void authenticateUser() async {
    try {
      var authentication = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (authentication != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      print('--------------------');
      print('Firebase auth error!');
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
                Flexible(
                  child: Hero(
                    tag: kLogoTag,
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
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
                      color: Colors.blueAccent, hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: kTextFieldDecoration(
                      color: Colors.blueAccent, hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    color: Colors.blueAccent,
                    text: 'Register',
                    callBack: () {
                      final progress = ProgressHUD.of(context);
                      progress.show();
                      authenticateUser();
                      Future.delayed(Duration(seconds: 1), () {
                        progress.dismiss();
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
