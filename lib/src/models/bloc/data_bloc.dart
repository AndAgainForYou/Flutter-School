import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, int> {
 DataBloc() : super(5) {
    on<CounterIncEvent>(_onIncrement);
    on<CounterDecEvent>(_onDecrement);
  }


  _onIncrement(CounterIncEvent event, Emitter<int> emit) {
    emit(state + 1);
  }
  _onDecrement(CounterDecEvent event, Emitter<int> emit) {
    if (state <= 0) return;
    emit(state - 1);
  }

}
