import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/i_lender_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ILenderRepository)
class LenderFunctions implements ILenderRepository {
  @override
  Future<void> addLender(LendingModel lenderDetails) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc()
          .collection('lender');

      String id = data.doc().id;
      LendingModel model = lenderDetails.copyWith(id: id);

      data.add(model.toJson());
      log('Lender added successfully!');
    } catch (e) {
      log('Error adding Lender: $e');
    }
  }

  @override
  Future<void> deleteLender(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<MainFailures, List<LendingModel>>> getDetails() async {
    final getData = await FirebaseFirestore.instance.collection('lender').get();

    try {
      final lenderDetails =
          getData.docs.map((e) => LendingModel.fromJson(e.data())).toList();
      if (lenderDetails.isEmpty) {
        return left(MainFailures.clientfailure());
      }
      // log(lenderDetails.toString());
      return right(lenderDetails);
    } catch (e) {
      log('error found: $e');
      return left(MainFailures.serverfailure());
    }
  }

  @override
  Future<void> updateLender(LendingModel lenderDetails) {
    throw UnimplementedError();
  }
}
