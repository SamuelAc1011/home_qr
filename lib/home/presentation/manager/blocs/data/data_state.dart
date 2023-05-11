part of 'data_bloc.dart';

enum DataStatus { initial, success, failure }

class DataState extends Equatable {
  // Constructor
  const DataState({
    this.time = '',
    this.status = DataStatus.initial,
  });

  // Attributes
  final String time;
  final DataStatus status;

  @override
  List<Object?> get props => [time, status];

  // Method: This method is used to copy the current state and modify the attributes
  DataState copyWith({
    String? time,
    DataStatus? status,
  }) =>
      DataState(
        time: time ?? this.time,
        status: status ?? this.status,
      );
}
