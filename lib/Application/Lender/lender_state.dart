part of 'lender_bloc.dart';

@freezed
class LenderState with _$LenderState {
  const factory LenderState({
    required List<LendingModel> data,
    required List<LendingModel> joinData,
    required bool isLoading,
    required Option getFailureOrSuccess,
  }) = _LenderState;
  factory LenderState.initial() => LenderState(
        data: [],
        joinData: [],
        isLoading: false,
        getFailureOrSuccess: none(),
      );
}
