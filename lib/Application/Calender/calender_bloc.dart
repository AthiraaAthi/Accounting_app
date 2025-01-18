import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calender_event.dart';
part 'calender_state.dart';
part 'calender_bloc.freezed.dart';

class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  CalenderBloc() : super(CalenderState.initial()) {
    on<GetDate>((event, emit) {
      emit(CalenderState(dateTime: event.datetime));
    });
  }
}
