import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poster/constants/routes.dart';
import 'package:poster/presentation_layer/pages/login_page.dart';
import 'package:poster/presentation_layer/pages/welcome_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.WELCOME:
      return MaterialPageRoute(
        builder: (_) => WelcomePage(),
      );
      break;
    case Routes.LOGIN:
      return MaterialPageRoute(
        builder: (_) => LoginPage(),
      );
      break;
    case Routes.HOME:
      return MaterialPageRoute(
        builder: (_) => null,
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('This page doesn\'t exist!'),
          ),
        ),
      );
      break;
  }
}
