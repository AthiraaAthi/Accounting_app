import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Expense%20model/expense_model.dart';
import 'package:curved_nav/domain/models/i_expense_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

const expense_db_name = 'expense-database';

@LazySingleton(as: IExpenseRepository)
class ExpenseFunctions implements IExpenseRepository {
  @override
  Future<void> expenseAdd(ExpenseModel values) async {
    try {
      final _expenseDatabase = await Hive.openBox(expense_db_name);
      final _id = DateTime.now().millisecondsSinceEpoch.toString();
      values.id = _id;
      _expenseDatabase.put(values.id, values);
    } catch (e) {}
  }

  @override
  Future<void> expenseDelete(String id) async {}

  @override
  Future<Either<MainFailures, List<ExpenseModel>>> expenseGet() async {
    throw UnimplementedError();
  }
}
