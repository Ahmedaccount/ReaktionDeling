import 'package:flutter/material.dart';
import 'package:reactionchat/screen/home/authenticate/register.dart';
import 'package:reactionchat/screen/home/authenticate/signIn.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool shownSignIn = true;
  void toggleview() {
    setState(() {
      shownSignIn = !shownSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shownSignIn) {
      return SignIn(toggleView: toggleview);
    } else {
      return register(
        toggleView: toggleview,
      );
    }
  }
}
