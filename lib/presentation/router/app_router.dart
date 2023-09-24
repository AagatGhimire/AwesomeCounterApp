import 'package:awesome_counter_app/presentation/screens/home_screen.dart';
import 'package:awesome_counter_app/presentation/screens/second_screen.dart';
import 'package:awesome_counter_app/presentation/screens/settings_screen.dart';
import 'package:awesome_counter_app/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: 'Home Screen',
            color: Colors.deepPurple.shade100,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: 'Second Screen',
            color: Colors.deepOrange.shade100,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: 'Third Screen',
            color: Colors.blue.shade100,
          ),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return null;
    }
  }
}
