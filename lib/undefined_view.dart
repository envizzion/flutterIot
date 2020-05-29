import 'package:flutter/material.dart';

class UndefinedView extends StatefulWidget {
  final String name;
  const UndefinedView({Key key, this.name}) : super(key: key);
  @override
  _AddUndefinedState createState() => _AddUndefinedState();
}

class _AddUndefinedState extends State<UndefinedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for ' + widget.name + 'is not defined'),
      ),
    );
  }
}
