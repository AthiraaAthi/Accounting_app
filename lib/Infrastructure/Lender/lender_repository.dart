import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/i_lender_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ILenderRepository)
class LenderFunctions implements ILenderRepository {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<void> addLender(LendingModel lenderDetails) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('lender');

      final docRef = data.doc();

      String id = docRef.id;
      String user = userId;
      LendingModel model = lenderDetails.copyWith(id: id, userId: user);

      docRef.set(model.toJson());

      log('Lender added successfully!');
      log('docId:${docRef.id}');
    } catch (e) {
      log('Error adding Lender: $e');
    }
  }

  @override
  Future<bool> deleteLender(String id) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final getData = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('lender');
    try {
      await getData.doc(id).delete();
      return true;
    } catch (e) {
      log('error detected while deleting:$e');
      return false;
    }
  }

  @override
  Future<Either<MainFailures, List<LendingModel>>> getDetails() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final getData = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('lender')
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
  Future<void> updateLastDate(String lastDate, dynamic value, String id) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('lender')
          .doc(id);

      data.update({
        lastDate: value,
      });
      log('Last date updated successfully!');
    } catch (e) {
      log('Error updating last date: $e');
    }
  }

  @override
  Future<void> removeTodayPendingDate(String docId) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('lender')
          .doc(docId);

      final getData = await data.get();

      if (getData.exists) {
        final snapshot = getData.data();

        List<dynamic> timestamps = snapshot?['listOfTImestamp'] ?? [];
        if (timestamps.isNotEmpty) {
          final now = DateTime.now();
          final today = DateTime(now.year, now.month, now.day);
          List<dynamic> filteredTimestamps = timestamps.where((e) {
            final date =
                e is String ? DateTime.parse(e) : (e as Timestamp).toDate();

            final normalizedDate = DateTime(date.year, date.month, date.day);
            return !normalizedDate.isBefore(today);
          }).toList();

          await data.update({'listOfTImestamp': filteredTimestamps});
        }
      }
    } catch (e) {}
  }

  @override
  Future<void> updateBalanceAmount(
    String balanceAmount,
    value,
    String id,
  ) async {
    try {
      final data = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('lender')
          .doc(id);

      await data.update({
        balanceAmount: value,
      });

      log('Balance Amount updated successfully!');
    } catch (e) {
      log('Error updating Balance Amount: $e');
    }
  }

  @override
  Future<Either<MainFailures, List<LendingModel>>> searchResult(
      String query) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final getData = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('lender')
        .where('searchQuery', isGreaterThan: query)
        .where('searchQuery', isLessThanOrEqualTo: '$query\uf8ff')
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
}

bool isDueDateNear(DateTime dueDate, {int thresholdDays = 2}) {
  final currentDate = DateTime.now();
  final difference = dueDate.difference(currentDate).inDays;
  return difference >= 0 && difference <= thresholdDays;
}
