import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibechat/firebase_options.dart';
import 'package:vibechat/screens/chat_screen.dart';
import 'package:vibechat/screens/login_screen.dart';
import 'package:vibechat/screens/registration_screen.dart';
import 'package:vibechat/screens/welcome_screen.dart';

Future<void> initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async{
  await initFirebase();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: 'welcome',
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
