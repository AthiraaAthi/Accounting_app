part of 'lender_bloc.dart';

@freezed
class LenderEvent with _$LenderEvent {
  const factory LenderEvent.getData() = GetData;
  const factory LenderEvent.joinGetData({required String code}) = JoinGetData;
  const factory LenderEvent.history(
      {required String id, required bool isJoiner}) = History;
  const factory LenderEvent.search({required String query}) = Search;
  const factory LenderEvent.clearSearch() = ClearSearch;
}
