import 'package:flutter/material.dart';
import 'package:jesus_light/undefined_view.dart';
import 'home_view.dart';
import 'login_view.dart';
import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case HomeViewRoute:
    //   return MaterialPageRoute(builder: (context) => HomeView());
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView());
  }
}
