import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:curved_nav/domain/functions/app_uninstall_clear_data.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IAppUninstallClearData)
class AppClear implements IAppUninstallClearData {
  @override
  Future<void> performPeriodicCleanup() async {
    final lastCleanup = await getLastCleanupTime();
    if (lastCleanup == null ||
        DateTime.now().difference(lastCleanup).inDays > 1) {
      // Perform cleanup
      // Example: Delete users with expired TTL locally
      await cleanupExpiredUser('someUserId');
      await saveLastCleanupTime();
    }
  }
}

Future<void> cleanupExpiredUser(String userId) async {
  final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
  if (userDoc.exists) {
    final data = userDoc.data();
    final expiresAt = data?['expiresAt']?.toDate();
    if (expiresAt != null && DateTime.now().isAfter(expiresAt)) {
      await FirebaseFirestore.instance.collection('users').doc(userId).delete();
      print('User $userId has been removed.');
    }
  }
}

Future<void> saveLastCleanupTime() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('lastCleanupTime', DateTime.now().millisecondsSinceEpoch);
}

Future<DateTime?> getLastCleanupTime() async {
  final prefs = await SharedPreferences.getInstance();
  final timestamp = prefs.getInt('lastCleanupTime');
  return timestamp != null
      ? DateTime.fromMillisecondsSinceEpoch(timestamp)
      : null;
}
