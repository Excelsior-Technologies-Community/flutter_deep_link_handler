import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static NavigatorState? get nav => key.currentState;

  static Future<void> pushNamed(String route, {Object? args}) async {
    await nav?.pushNamed(route, arguments: args);
  }

  static Future<void> pushReplacementNamed(String route, {Object? args}) async {
    await nav?.pushReplacementNamed(route, arguments: args);
  }
}
