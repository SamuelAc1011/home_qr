part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GpsAndPermissionEvent extends LocationEvent {
  // Attributes
  final bool isGpsEnabled;
  final bool isPermissionGranted;

  // Constructor
  const GpsAndPermissionEvent({
    required this.isGpsEnabled,
    required this.isPermissionGranted,
  });
}
