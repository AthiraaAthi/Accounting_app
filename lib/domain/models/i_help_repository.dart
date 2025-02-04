import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/help%20model/help_model.dart';
import 'package:dartz/dartz.dart';

abstract class IHelpRepository {
  Future<void> addHelpRequest(HelpModel helpModel);
  Future<void> deleteHelpRequest(String id);
  Future<Either<MainFailures, List<HelpModel>>> getHelpRequests();
}
