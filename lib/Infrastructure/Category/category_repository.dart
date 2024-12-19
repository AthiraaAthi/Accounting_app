import 'dart:developer';

import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/category%20model/category_model.dart';
import 'package:curved_nav/domain/models/i_category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

const category_db_name = 'category-database';

@LazySingleton(as: ICategoryRepository)
class CategoryFunctions implements ICategoryRepository {
  @override
  Future<void> categoryAdd(CategoryModel values) async {
    try {
      final _categoryDatabase =
          await Hive.openBox<CategoryModel>(category_db_name);
      final _id = await _categoryDatabase.add(values);

      values.id = _id;
      _categoryDatabase.put(values.id, values);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> categoryDelete(int id) async {
    final _categoryDatabase =
        await Hive.openBox<CategoryModel>(category_db_name);
    await _categoryDatabase.delete(id);
  }

  @override
  Future<Either<MainFailures, List<CategoryModel>>> categoryGet() async {
    try {
      final _categoryDatabase =
          await Hive.openBox<CategoryModel>(category_db_name);
      final data = _categoryDatabase.values.toList();

      if (data.isNotEmpty) {
        return Right(data);
      }
      log('Empty');
      return right([]);
    } catch (e) {
      log(e.toString());
      return left(MainFailures.clientfailure());
    }
  }
}
