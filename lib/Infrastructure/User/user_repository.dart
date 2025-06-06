import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/domain/functions/user_detection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IUserDetection)
class UserRepository implements IUserDetection {
  @override
  Future<void> handleUserRegistration() async {
    final userId = await getUserIdFromLocal();
    log("Retrieved userId: $userId");
    bool isOnline = await InternetConnection().hasInternetAccess;

    if (userId != null) {
      if (isOnline) {
        await _checkAndRegisterUser(userId);
      } else {
        log('Offline - Using stored userId: $userId');
        _listenForInternetAndRegister(userId);
      }
    } else {
      if (isOnline) {
        log('New user detected');
        await registerNewUser();
      } else {
        log('Offline - Cannot register user, waiting for internet...');
        _listenForInternetAndRegister(null);
      }
    }
  }

  Future<void> _checkAndRegisterUser(String userId) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        await userDoc.reference
            .update({'lastAppUsed': FieldValue.serverTimestamp()});
        log('Existing user updated');
      } else {
        log('New user detected');
        await registerNewUser();
      }
    } catch (e) {
      log('Firestore Error: $e');
    }
  }

  void _listenForInternetAndRegister(String? userId) {
    InternetConnection().onStatusChange.listen((status) async {
      if (status == InternetStatus.connected) {
        log('Internet is back! Registering user...');
        if (userId != null) {
          await _checkAndRegisterUser(userId);
        } else {
          await registerNewUser();
        }
      }
    });
  }

  Future<void> registerUser(String userId) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    await userRef.set({
      'userId': userId,
      'registeredAt': FieldValue.serverTimestamp(),
      'lastAppUsed': FieldValue.serverTimestamp(),
    });
  }

  Future<String> signInAnonymously() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user!.uid;
  }

  Future<void> saveUserIdLocally(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<String?> getUserIdFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<void> registerNewUser() async {
    String newUserId = await signInAnonymously();
    await registerUser(newUserId);
    await saveUserIdLocally(newUserId);
  }

  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
