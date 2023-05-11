// Flutter
import 'dart:async';

// Packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  // Attribute
  StreamSubscription? gpsServiceSubscription;

  // Constructor
  LocationBloc()
      : super(const LocationState(
            isGpsEnabled: false, isPermissionGranted: false)) {
    _init();

    // Event: This event is used to check the GPS status
    on<GpsAndPermissionEvent>(
      (event, emit) => emit(
        state.copyWith(
          isGpsEnabled: event.isGpsEnabled,
          isPermissionGranted: event.isPermissionGranted,
        ),
      ),
    );
  }

  // Method: This method is used to initialize the bloc
  Future<void> _init() async {
    // Variable
    final gpsInitStatus = await Future.wait([
      _checkGpsStatus(),
      _isPermissionGranted(),

    ]);

    add(
      GpsAndPermissionEvent(
        isGpsEnabled: gpsInitStatus[0],
        isPermissionGranted: gpsInitStatus[1],
      ),
    );
  }

  // Method: This method is used to check the GPS status
  Future<bool> _checkGpsStatus() async {
    // Variable
    final isEnable = await Geolocator.isLocationServiceEnabled();

    //? Check constantly that the GPS is enabled
    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      final isGpsEnabled = (event.index == 1) ? true : false;
      add(GpsAndPermissionEvent(
        isGpsEnabled: isGpsEnabled,
        isPermissionGranted: state.isPermissionGranted,
      ));
    });
    return isEnable;
  }

  // Method: This method is used to ask for GPS access
  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.granted:
        add(GpsAndPermissionEvent(
          isGpsEnabled: state.isGpsEnabled,
          isPermissionGranted: true,
        ));
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add(GpsAndPermissionEvent(
          isGpsEnabled: state.isGpsEnabled,
          isPermissionGranted: false,
        ));
        openAppSettings();
    }
  }

  // Method: This method is used to check the GPS permission
  Future<bool> _isPermissionGranted() async {
    final status = await Permission.location.isGranted;
    return status;
  }

  // Method: Remove the bloc
  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
