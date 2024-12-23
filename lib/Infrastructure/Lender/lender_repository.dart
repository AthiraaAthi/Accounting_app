import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/i_lender_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ILenderRepository)
class LenderFunctions implements ILenderRepository {
  @override
  Future<void> addLender(LendingModel lenderDetails) {
    // TODO: implement addLender
    throw UnimplementedError();
  }

  @override
  Future<void> deleteLender(String id) {
    // TODO: implement deleteLender
    throw UnimplementedError();
  }

  @override
  Future<Either<MainFailures, List<LendingModel>>> getDetails() {
    // TODO: implement getDetails
    throw UnimplementedError();
  }

  @override
  Future<void> updateLender(LendingModel lenderDetails) {
    // TODO: implement updateLender
    throw UnimplementedError();
  }
}
