import 'package:flutter/material.dart';
import 'package:reactionchat/common/constants.dart';
import 'package:reactionchat/common/loading.dart';
import 'package:reactionchat/screen/home/authenticate/signIn.dart';
import 'package:reactionchat/services/auth.dart';
import 'package:reactionchat/screen/home/authenticate/signIn.dart';

class register extends StatefulWidget {
  //register({Key? key}) : super(key: key);

  final Function toggleView;
  register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 144, 248, 144),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 2, 139, 43),
              elevation: 0.0,
              title: Text("Sign up"),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                      // Navigator.pop(context);
                    },
                    icon: Icon(Icons.person_sharp),
                    label: Text("Sign in"))
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
                          hintText: "E-mail",
                          icon: Icon(Icons.email_outlined),
                        ),
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
                          dynamic result = await _auth.registerWithEmailAndPass(
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
                        "Create user",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ));
  }
}
