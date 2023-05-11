// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Imports
import 'home/data/services/time_service.dart';
import 'home/presentation/manager/manager.dart';
import 'home/presentation/screens/screens.dart';

void main() async => runApp(const MyAppState());

class MyAppState extends StatelessWidget {
// Constructor
  const MyAppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationBloc()),
        BlocProvider(
          create: (_) => DataBloc(TimeService())..add(DataFetched()),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'loading_screen',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurpleAccent,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'main_screen': (_) => const HomeScreen(),
        'error_screen': (_) => const GPSAccessScreen(),
        'loading_screen': (_) => const LoadingScreen(),
      },
    );
  }
}
