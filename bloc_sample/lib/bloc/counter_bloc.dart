import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  static var number = 100;

  CounterBloc() : super(CounterInitial(initNumber: number)) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrementPressed) {
        emit(CounterNumUpdateInprogress(updatedNumber: ++number));
      }
      if (event is CounterDecrementPressed) {
        emit(CounterNumUpdateInprogress(updatedNumber: --number));
      }
      if (event is CounterResetPressed) {
        number = 0;
        emit(CounterNumUpdateInprogress(updatedNumber: number));
      }
    });
  }
}
