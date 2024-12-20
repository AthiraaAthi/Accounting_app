part of 'expense_bloc.dart';

@freezed
class ExpenseState with _$ExpenseState {
  const factory ExpenseState({
    required bool isEmpty,
    required List<ExpenseModel> expense,
    required Option getFailureOrSuccessState,
  }) = _ExpenseState;
  factory ExpenseState.initial() {
    return ExpenseState(
        isEmpty: false, expense: [], getFailureOrSuccessState: none());
  }
}
