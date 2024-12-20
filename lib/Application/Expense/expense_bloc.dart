import 'package:bloc/bloc.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Expense%20model/expense_model.dart';
import 'package:curved_nav/domain/models/i_expense_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expense_event.dart';
part 'expense_state.dart';
part 'expense_bloc.freezed.dart';

@injectable
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final IExpenseRepository iExpenseRepository;
  ExpenseBloc(this.iExpenseRepository) : super(ExpenseState.initial()) {
    on<GetExpense>((event, emit) async {
      emit(state.copyWith(isEmpty: false, getFailureOrSuccessState: none()));
      final Either<MainFailures, List<ExpenseModel>> getCategoryNames =
          await iExpenseRepository.expenseGet();
      emit(getCategoryNames.fold(
          (failures) => state.copyWith(
              isEmpty: true,
              getFailureOrSuccessState: some(failures)), (success) {
        success.sort((first, second) => second.id!.compareTo(first.id!));
        return state.copyWith(
            isEmpty: false,
            getFailureOrSuccessState: some(success),
            expense: success);
      }));
    });
    on<AddExpense>((event, emit) async {
      emit(state.copyWith(isEmpty: false, getFailureOrSuccessState: none()));
      final result = await iExpenseRepository.expenseGet();
      emit(result.fold(
          (failures) => state.copyWith(
              isEmpty: true,
              getFailureOrSuccessState: some(failures)), (success) {
        success.sort((first, second) => second.id!.compareTo(first.id!));
        return state.copyWith(
            isEmpty: false,
            getFailureOrSuccessState: some(success),
            expense: success);
      }));
    });
  }
}
