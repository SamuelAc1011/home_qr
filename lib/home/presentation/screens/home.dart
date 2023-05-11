//Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_qr/home/presentation/manager/manager.dart';

class HomeScreen extends StatelessWidget {
  /// This widget contains the home screen of the app.
  ///
  /// The user will see the data used by the locator and the current hour.

  // Constructor
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            return Text('Time api: ${state.time}');
          },
        ),
      ),
    );
  }
}