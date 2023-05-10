//Flutter
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  /// This widget contains the home screen of the app.
  ///
  /// The user will see the data used by the locator and the current hour.

  // Constructor
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}