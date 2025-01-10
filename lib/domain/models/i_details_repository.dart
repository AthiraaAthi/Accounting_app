import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/history%20and%20others%20model/detail_model.dart';
import 'package:dartz/dartz.dart';

abstract class IDetailsRepository {
  Future<void> addDetails(DetailModel detailsModel, String lenderId);
  Future<Either<MainFailures, List<DetailModel>>> getDetails();
}
