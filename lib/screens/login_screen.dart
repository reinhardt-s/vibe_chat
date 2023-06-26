import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibechat/components/rouded_text_field.dart';
import 'package:vibechat/components/rounded_button.dart';
import 'package:vibechat/logic/authentication.dart';
import 'package:vibechat/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  String emailAddress = '';
  String password = '';
  Authentication authentication = Authentication();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authentication.checkAuthState(onSignedIn: (){
      print('Redirect to chat screen');
      Navigator.pushNamed(context, ChatScreen.id);
    });
  }



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
                emailAddress = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedTextField(
              hint: 'Enter your password',
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                authentication.login(emailAddress: emailAddress, password: password);
              },
            ),
          ],
        ),
      ),
    );
  }
}
