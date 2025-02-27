import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/i_join_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IJoinRepository)
class JoinFunctions implements IJoinRepository {
  @override
  Future<Either<MainFailures, List<LendingModel>>> getJoinCardInformation(
      String code) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final connectivityResult = await Connectivity().checkConnectivity();
    try {
      final usersSnapshot = await firestore.collection('users').get();

      for (var userDoc in usersSnapshot.docs) {
        final nestedCollection = userDoc.reference.collection('lender');

        final nestedSnapshot =
            await nestedCollection.where('shareCode', isEqualTo: code).get();

        final data = nestedSnapshot.docs
            .map((e) => LendingModel.fromJson(e.data()))
            .toList();
        if (connectivityResult == ConnectivityResult.none) {
          return left(MainFailures.serverfailure());
        } else
          return right(data);
      }
      return left(MainFailures.serverfailure());
    } catch (e) {
      print('Error searching for shareCode: $e');
      return left(MainFailures.clientfailure());
    }
  }
}
