import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:dartz/dartz.dart';

abstract class IJoinRepository {
  Future<Either<MainFailures, List<LendingModel>>> getJoinCardInformation(
      String code);
  Future<Either<MainFailures, List<LendingModel>>> getJoinCard();
  Future<void> addJoinCard(LendingModel model);
  Future<bool> deleteJoinCard(String id);
}
