// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// Imports
import 'package:home_qr/home/presentation/manager/manager.dart';

class GPSAccessScreen extends StatelessWidget {
  /// This widget shows the screen that asks the user for permission to access
  /// the GPS if the user has not granted it yet.
  ///
  /// If the user has already granted the permission, the screen will show a
  /// message asking the user to activate the GPS when it is turned off.

  // Constructor
  const GPSAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            // Condition: Is the GPS enabled?
            return !state.isGpsEnabled
                // * Yes: Show the message to activate the GPS
                ? const AccessPermission()
                // * No: Show the message to ask for permission
                : const ActivateAccess();
          },
        ),
      ),
    );
  }
}

class AccessPermission extends StatelessWidget {
  // Constructor
  const AccessPermission({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Activa tu ubicación para continuar',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Lottie.network(
          'https://assets8.lottiefiles.com/private_files/lf30_7tjsbbp7.json',
          reverse: true,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
      ],
    );
  }
}

class ActivateAccess extends StatelessWidget {
  // Constructor
  const ActivateAccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Necesitamos permisos de ubicación para continuar',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Lottie.network(
          'https://assets8.lottiefiles.com/packages/lf20_jif9vljs.json',
          reverse: true,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        ElevatedButton(
          onPressed: () =>
              BlocProvider.of<LocationBloc>(context).askGpsAccess(),
          child: const Text('Solicitar Acceso'),
        )
      ],
    );
  }
}
