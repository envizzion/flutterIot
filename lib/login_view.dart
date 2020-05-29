import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _AddLoginState createState() => _AddLoginState();
}

class _AddLoginState extends State<LoginView> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FlatButton(
        onPressed: () {
          /*...*/ setState(() {
            this.count++;
          });
        },
        child: Text(
          "Flat Button " + this.count.toString(),
        ),
      ),
    ));
  }
}
