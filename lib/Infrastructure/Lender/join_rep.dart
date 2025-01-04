import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';

Future<List<LendingModel>> searchByShareCode(String code) async {
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
        log('Found Code: ${data}');

        return data;
      }
    }
    return [];
  } catch (e) {
    print('Error searching for shareCode: $e');
    return [];
  }
}
