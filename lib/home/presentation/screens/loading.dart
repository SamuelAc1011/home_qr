// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Imports
import 'package:home_qr/home/presentation/manager/manager.dart';
import 'package:home_qr/home/presentation/screens/screens.dart';


class LoadingScreen extends StatelessWidget {
  /// This widget is the root of our application.
  ///
  /// This section of the app is responsible for the loading screen, which is
  /// the first screen that the user sees when the app is opened.


  // Constructor
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          // Condition: The user has granted all the permissions?
          return state.isAllGranted
              // * Yes
              ? const HomeScreen()
              // * No
              : const GPSAccessScreen();
        },
      ),
    );
  }
}
