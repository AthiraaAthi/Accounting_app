import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/history%20and%20others%20model/history_model.dart';

import 'package:dartz/dartz.dart';

abstract class IHistoryRepository {
  Future<void> addDetails(HistoryModel historyModel, String lenderId);
  Future<Either<MainFailures, List<HistoryModel>>> getDetails();
}
