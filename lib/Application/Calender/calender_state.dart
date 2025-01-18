part of 'calender_bloc.dart';

@freezed
class CalenderState with _$CalenderState {
  const factory CalenderState({required DateTime? dateTime}) = _CalenderState;
  factory CalenderState.initial() {
    return CalenderState(dateTime: null);
  }
}
