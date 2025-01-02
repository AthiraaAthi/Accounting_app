import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:dartz/dartz.dart';

import 'Lending Card model/lending_model.dart';

abstract class ILenderRepository {
  Future<void> addLender(LendingModel lenderDetails);
  Future<void> updateLender(LendingModel lenderDetails);
  Future<void> deleteLender(String id);
  Future<Either<MainFailures, List<LendingModel>>> getDetails();
}
