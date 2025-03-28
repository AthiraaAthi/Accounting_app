part of 'join_bloc.dart';

@freezed
class JoinState with _$JoinState {
  const factory JoinState({
    required List<LendingModel> joinData,
    required bool isLoading,
    required bool isError,
    required Option getFailureOrSuccess,
  }) = _JoinState;
  factory JoinState.initial() {
    return JoinState(
        joinData: [],
        isLoading: false,
        isError: false,
        getFailureOrSuccess: none());
  }
}
