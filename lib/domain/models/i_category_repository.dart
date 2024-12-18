import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/category%20model/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository {
  Future<Either<MainFailures, List<CategoryModel>>> categoryGet();
  Future<void> categoryAdd(CategoryModel values);
  Future<void> categoryDelete(CategoryModel values);
}
