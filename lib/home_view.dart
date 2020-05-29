import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final FirebaseDatabase database;

  const HomeView(this.database);
  @override
  _AddHomeState createState() => _AddHomeState();
}

class _AddHomeState extends State<HomeView> {
  void setMode(int mode) {
    widget.database.reference().child("devices/1234/mode").set(mode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(
              onPressed: () {
                setMode(0);
              },
              child: Text("Warm White Light")),
          RaisedButton(
              onPressed: () {
                setMode(1);
              },
              child: Text("Natural White Light")),
          RaisedButton(
              onPressed: () {
                setMode(2);
              },
              child: Text("Cozy Candle")),
          RaisedButton(
              onPressed: () {
                setMode(3);
              },
              child: Text("Sunday Coffee")),
          RaisedButton(
              onPressed: () {
                setMode(4);
              },
              child: Text("Meditation")),
          RaisedButton(
              onPressed: () {
                setMode(5);
              },
              child: Text("Enchanted Forest")),
          RaisedButton(
              onPressed: () {
                setMode(6);
              },
              child: Text("Night Adventure")),
          RaisedButton(
              onPressed: () {
                setMode(7);
              },
              child: Text("Rainbow!")),
        ]),
      ),
    );
  }
}
