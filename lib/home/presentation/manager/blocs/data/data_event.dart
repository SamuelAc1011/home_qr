part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DataFetched extends DataEvent {}
