import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/domain/functions/user_detection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IUserDetection)
class UserRepository implements IUserDetection {
  @override
  Future<void> handleUserRegistration() async {
    final userId = await getUserIdFromLocal();

    if (userId != null) {
      // Check if the user still exists in Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (!userDoc.exists) {
        // Register as a new user
        String newUserId = await signInAnonymously();
        await registerUser(newUserId);
        await saveUserIdLocally(newUserId);
      }
    } else {
      // No local user ID; register a new user
      String newUserId = await signInAnonymously();
      await registerUser(newUserId);
      await saveUserIdLocally(newUserId);
    }
  }
}

Future<void> registerUser(String userId) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  // Create the user document
  await userRef.set({
    'userId': userId,
    'registeredAt':
        DateTime.now().add(Duration(days: 40)), // Example TTL: 7 days,
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
