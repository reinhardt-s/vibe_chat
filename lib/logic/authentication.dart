import 'package:firebase_auth/firebase_auth.dart';

class Authentication{

  Authentication();
  final _instance = FirebaseAuth.instance;

  String getUsername(){
    return _instance.currentUser!.email!;
  }

  void checkAuthState({Function? onSignedIn, Function? onSignedOut}) {
    _instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        if (onSignedOut != null) {
          onSignedOut();
        }
      } else {
        print('User is signed in!');
        if( onSignedIn != null ){
          onSignedIn();
        }
      }
    });
  }

  Future<User?> register({required String emailAddress, required String password}) async {
    print('Register');
    try {
      final credential = await _instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential.user);
      return login(emailAddress: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print(e);
      }
      return null;
    }
  }

  Future<void> logout() async {
    print('Logout');
    await _instance.signOut();
  }

  Future<User?> login({required String emailAddress, required String password} ) async {
    print('Login');
    try {
      final credential = await _instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential.user);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e);
      }
      return null;
    }
  }
}
