import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/i_join_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IJoinRepository)
class JoinFunctions implements IJoinRepository {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<Either<MainFailures, List<LendingModel>>> getJoinCardInformation(
      String code) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final usersSnapshot = await firestore.collection('users').get();

      for (var userDoc in usersSnapshot.docs) {
        final nestedCollection = userDoc.reference.collection('lender');

        final nestedSnapshot =
            await nestedCollection.where('shareCode', isEqualTo: code).get();

        final data = nestedSnapshot.docs
            .map((e) => LendingModel.fromJson(e.data()))
            .toList();

        if (data.isNotEmpty) {
          return right(data);
        }
      }
      return left(MainFailures.clientfailure());
    } catch (e) {
      print('Error searching for shareCode: $e');
      return left(MainFailures.serverfailure());
    }
  }

  @override
  Future<void> addJoinCard(LendingModel model) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('joined lender');

      final docRef = data.doc();
      String id = docRef.id;

      LendingModel lmodel = model.copyWith(id: id);
      docRef.set(lmodel.toJson());

      log('Lender added successfully!');
      log('docId:${docRef.id}');
    } catch (e) {
      log('Error adding Lender: $e');
    }
  }

  @override
  Future<Either<MainFailures, List<LendingModel>>> getJoinCard() async {
    final getData = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('joined lender')
        .get();

    try {
      final lenderDetails =
          getData.docs.map((e) => LendingModel.fromJson(e.data())).toList();

      return right(lenderDetails);
    } catch (e) {
      log('error found: $e');
      return left(MainFailures.clientfailure());
    }
  }

  @override
  Future<bool> deleteJoinCard(String id) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final getData = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('joined lender');
    try {
      await getData.doc(id).delete();
      return true;
    } catch (e) {
      log('error detected while deleting:$e');
      return false;
    }
  }
}

void fetchAndCopyData(LendingModel lenderData) async {
  final model = lenderData;

  await JoinFunctions().addJoinCard(model);
}

void syncLenderDocument(
    String sourceUserId, String lenderId, String targetDocId) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  firestore
      .collection('users')
      .doc(sourceUserId)
      .collection('lender')
      .doc(lenderId)
      .snapshots()
      .listen((snapshot) async {
    if (snapshot.exists) {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('joined lender')
          .doc(targetDocId)
          .set(
              {
            'balanceAmount': snapshot['balanceAmount'],
            'lastMoneyGivenDate': snapshot['lastMoneyGivenDate'],
            'listOfTImestamp': snapshot['listOfTImestamp']
          },
              SetOptions(mergeFields: [
                'balanceAmount',
                'lastMoneyGivenDate',
                'listOfTImestamp'
              ]));

      log('synced data');
    } else {
      log('Source document deleted. Consider handling this case.');
    }
  });
  firestore
      .collection('users')
      .doc(sourceUserId)
      .collection('lender')
      .doc(lenderId)
      .collection('details')
      .snapshots()
      .listen((detailsSnapshot) async {
    for (var detailDoc in detailsSnapshot.docs) {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('joined lender')
          .doc(targetDocId)
          .collection('details')
          .doc(detailDoc.id)
          .set(detailDoc.data(), SetOptions(merge: true));
    }

    log('✅ Synced details subcollection!');
  });
}
