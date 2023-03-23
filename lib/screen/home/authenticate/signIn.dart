import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reactionchat/common/constants.dart';
import 'package:reactionchat/common/loading.dart';
import 'package:reactionchat/screen/home/authenticate/register.dart';
import 'package:reactionchat/services/auth.dart';
import 'package:reactionchat/screen/home/authenticate/register.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  // text field states
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 4, 248, 4),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 2, 139, 43),
              elevation: 0.0,
              title: Text("Sign in"),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => register()),
                      // );
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person_sharp),
                    label: Text("Register"))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter an E-mail' : null,
                        decoration: textInputdecoration.copyWith(
                            hintText: "Password", icon: Icon(Icons.email)),
                        onChanged: (value) => {setState(() => email = value)}),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) => value!.length < 6
                            ? "Enter password 6 character long"
                            : null,
                        obscureText: true,
                        decoration: textInputdecoration.copyWith(
                            hintText: "Password", icon: Icon(Icons.password)),
                        onChanged: (value) =>
                            {setState(() => password = value)}),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          dynamic result = await _auth.signInWithEmailAndPass(
                              email, password);
                          if (result == null) {
                            setState(() {
                              error = "Please supply a valid e-mail";
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 48, 82, 49)),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    SizedBox(height: 50.0),
                    const Text.rich(
                      TextSpan(
                        text: "Doesn't have an ", // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'account?',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          widget.toggleView();
                        },
                        icon: Icon(Icons.person_sharp),
                        label: Text("Register here"))
                  ],
                ),
              ),
            ));
  }
}

class White {}
