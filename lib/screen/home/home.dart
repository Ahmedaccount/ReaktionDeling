import 'package:flutter/material.dart';
import 'package:reactionchat/screen/home/authenticate/signIn.dart';
import 'package:reactionchat/services/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 71, 143, 73),
      appBar: AppBar(
        title: Text("Throne"),
        backgroundColor: Color.fromARGB(255, 142, 179, 100),
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.Signout();
              },
              icon: Icon(Icons.engineering),
              label: Text("Log out"))
        ],
      ),
    );
  }
}
