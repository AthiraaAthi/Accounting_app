import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/history%20and%20others%20model/history_model.dart';

import 'package:curved_nav/domain/models/i_history_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHistoryRepository)
class HistoryFunctions implements IHistoryRepository {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<void> addDetails(HistoryModel detailsModel, String lenderId) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('lender');
      final detailsData = data.doc(lenderId).collection('details');

      String id = detailsData.doc().id;
      HistoryModel model =
          detailsModel.copyWith(id: id, timestamp: Timestamp.now().toString());

      detailsData.add(model.toJson());
      log('detail added successfully!');
    } catch (e) {
      log('error while adding data: $e');
    }
  }

  @override
  Future<Either<MainFailures, List<HistoryModel>>> getDetails(
      String lenderId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('lender')
        .doc(lenderId)
        .collection('details')
        .get();
    try {
      final historyDetails =
          data.docs.map((e) => HistoryModel.fromJson(e.data())).toList();
      if (connectivityResult == ConnectivityResult.none) {
        return left(MainFailures.serverfailure());
      }

      return right(historyDetails);
    } catch (e) {
      log('error found:$e');
      return left(MainFailures.clientfailure());
    }
  }
}
