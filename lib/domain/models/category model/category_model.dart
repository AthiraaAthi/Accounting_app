import 'package:hive_flutter/adapters.dart';
part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String categoryName;

  CategoryModel({this.id, required this.categoryName});
}
