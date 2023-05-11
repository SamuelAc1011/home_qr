// Packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_qr/home/data/services/time_service.dart';

part 'data_event.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  // Attribute
  final TimeService timeService;

  DataBloc(this.timeService) : super(const DataState()) {
    on<DataFetched>(_onDataFetched);
  }

  Future<void> _onDataFetched(
      DataFetched event, Emitter<DataState> emit) async {
    try {
      final timeData = await timeService.getTimeZone(19.629209, -99.105143);
      emit(state.copyWith(time: timeData.time, status: DataStatus.success));
    } catch (error) {
      emit(state.copyWith(status: DataStatus.failure));
    }
  }
}
