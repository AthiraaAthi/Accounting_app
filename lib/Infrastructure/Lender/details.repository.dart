import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/history%20and%20others%20model/detail_model.dart';
import 'package:curved_nav/domain/models/i_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDetailsRepository)
class DetailsFunctions implements IDetailsRepository {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<void> addDetails(DetailModel detailsModel, String lenderId) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('lender');
      final detailsData = data.doc(lenderId).collection('details');

      String id = detailsData.doc().id;
      DetailModel model = detailsModel.copyWith(id: id);

      detailsData.add(model.toJson());
      log('detail added successfully!');
    } catch (e) {
      log('error while adding data: $e');
    }
  }

  @override
  Future<Either<MainFailures, List<DetailModel>>> getDetails() {
    // TODO: implement getDetails
    throw UnimplementedError();
  }
}
