part of 'lender_bloc.dart';

@freezed
class LenderState with _$LenderState {
  const factory LenderState({
    required List<LendingModel> data,
    required List<LendingModel> joinData,
    required List<LendingModel> searchData,
    required List<HistoryModel> historyData,
    required bool isLoading,
    required Option getFailureOrSuccess,
  }) = _LenderState;
  factory LenderState.initial() => LenderState(
        data: [],
        joinData: [],
        historyData: [],
        searchData: [],
        isLoading: false,
        getFailureOrSuccess: none(),
      );
}
