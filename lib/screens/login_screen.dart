import 'package:flutter/material.dart';
import 'package:vibechat/components/rouded_text_field.dart';
import 'package:vibechat/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Hero(tag: 'logo', child: Image.asset('assets/images/vibe_chat.png')),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedTextField(
              hint: 'Enter your email',
              onChanged: (value) {
                //Do something with the user input.
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedTextField(
              hint: 'Enter your password',
              onChanged: (value) {
                //Do something with the user input.
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                //Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
