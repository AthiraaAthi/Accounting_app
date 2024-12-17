import 'package:hive_flutter/adapters.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String amount;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String date;

  ExpenseModel(
      {required this.id,
      required this.amount,
      required this.category,
      required this.description,
      required this.date});
}
