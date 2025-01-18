part of 'calender_bloc.dart';

@freezed
class CalenderEvent with _$CalenderEvent {
  const factory CalenderEvent.getDate({required DateTime datetime}) = GetDate;
}
