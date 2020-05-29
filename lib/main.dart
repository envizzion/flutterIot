import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:jesus_light/undefined_view.dart';
import 'package:jesus_light/wifi_setup.dart';
import 'home_view.dart';
import 'login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Named Routing',
//       onGenerateRoute: router.generateRoute,
//       initialRoute: HomeViewRoute,
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _AddBottomNavBar createState() => _AddBottomNavBar();
}

class _AddBottomNavBar extends State<BottomNavBar> {
  int _currentIndex = 0;

  static FirebaseDatabase _database = FirebaseDatabase.instance;
  static FlutterBlue flutterBlue = FlutterBlue.instance;

  String nodeName = "devices/1234";

  final List<Widget> childernWidgets = [
    WifiSetter(flutterBlue),
    HomeView(_database),
    UndefinedView(),
    LoginView()
  ];

  _childAdded(Event event) {
    String key = event.snapshot.key;
    String val = event.snapshot.value["currentLocation"];

    print('childd added:' + key);
  }

  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
  }

  void onBottomBarTap(int index) {
    if (index != 0) {
      flutterBlue.stopScan();
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childernWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomBarTap,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.control_point), title: new Text("setup")),
            BottomNavigationBarItem(
                icon: new Icon(Icons.settings), title: new Text("modes")),
            BottomNavigationBarItem(
                icon: new Icon(Icons.contacts), title: new Text("picker")),
          ]),
    );
  }
}
