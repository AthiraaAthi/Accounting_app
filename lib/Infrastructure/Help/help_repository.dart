import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/help%20model/help_model.dart';

import 'package:curved_nav/domain/models/i_help_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHelpRepository)
class HelpRepository implements IHelpRepository {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<void> addHelpRequest(HelpModel helpModel) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('helpRequest');

      String id = data.doc().id;
      HelpModel model = helpModel.copyWith(
        id: id,
      );

      data.add(model.toJson());
      log('detail added successfully!');
    } catch (e) {
      log('error while adding data: $e');
    }
  }

  @override
  Future<void> deleteHelpRequest(String id) async {}

  @override
  Future<Either<MainFailures, List<HelpModel>>> getHelpRequests() async {
    final getData = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('helpRequest')
        .get();

    try {
      final helpRequestDetails =
          getData.docs.map((e) => HelpModel.fromJson(e.data())).toList();
      if (helpRequestDetails.isEmpty) {
        return left(MainFailures.clientfailure());
      }

      return right(helpRequestDetails);
    } catch (e) {
      log('error found: $e');
      return left(MainFailures.serverfailure());
    }
  }
}
