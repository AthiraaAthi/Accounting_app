import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:dartz/dartz.dart';

import 'Lending Card model/lending_model.dart';

abstract class ILenderRepository {
  Future<void> addLender(LendingModel lenderDetails);
  Future<void> updateLastDate(String lastDate, dynamic value, String id);
  Future<void> updateBalanceAmount(
      String balanceAmount, dynamic value, String id);
  Future<void> deleteLender(String id);
  Future<Either<MainFailures, List<LendingModel>>> getDetails();
  Future<void> removeTodayPendingDate(String docId);
  Future<Either<MainFailures, List<LendingModel>>> searchResult(String query);
}
