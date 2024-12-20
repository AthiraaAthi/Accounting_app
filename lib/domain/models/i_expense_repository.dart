import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Expense%20model/expense_model.dart';
import 'package:dartz/dartz.dart';

abstract class IExpenseRepository {
  Future<Either<MainFailures, List<ExpenseModel>>> expenseGet();
  Future<void> expenseAdd(ExpenseModel values);
  Future<void> expenseDelete(String id);
}
