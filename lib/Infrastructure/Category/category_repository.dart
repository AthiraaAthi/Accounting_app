import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/category%20model/category_model.dart';
import 'package:curved_nav/domain/models/i_category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICategoryRepository)
class CategoryFunctions implements ICategoryRepository {
  @override
  Future<void> categoryAdd(CategoryModel values) {
    // TODO: implement categoryAdd
    throw UnimplementedError();
  }

  @override
  Future<void> categoryDelete(CategoryModel values) {
    // TODO: implement categoryDelete
    throw UnimplementedError();
  }

  @override
  Future<Either<MainFailures, List<CategoryModel>>> categoryGet() {
    // TODO: implement categoryGet
    throw UnimplementedError();
  }
}
