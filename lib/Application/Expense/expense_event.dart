part of 'expense_bloc.dart';

@freezed
class ExpenseEvent with _$ExpenseEvent {
  const factory ExpenseEvent.getExpense() = GetExpense;
  const factory ExpenseEvent.addExpense() = AddExpense;
}
