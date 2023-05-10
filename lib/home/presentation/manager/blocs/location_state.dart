part of 'location_bloc.dart';

class LocationState extends Equatable {
  // Constructor
  const LocationState({
    required this.isGpsEnabled,
    required this.isPermissionGranted,
  });

  // Attributes
  final bool isGpsEnabled;
  final bool isPermissionGranted;

  // Method: Getter that tell us if the GPS is enabled and the permission is granted
  bool get isAllGranted => isGpsEnabled && isPermissionGranted;

  @override
  List<Object?> get props => [isGpsEnabled, isPermissionGranted];

  // Method: This method is used to copy the current state and modify the attributes
  LocationState copyWith({
    bool? isGpsEnabled,
    bool? isPermissionGranted,
  }) =>
      LocationState(
        isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
        isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      );
}
