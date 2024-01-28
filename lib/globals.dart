// import 'package:shared_preferences/shared_preferences.dart';

// class GlobalData {
//   static String? currentUserUid;

//   static Future<void> saveUserUid() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userUid', currentUserUid!);
//   }

//   static Future<void> loadUserUid() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     currentUserUid = prefs.getString('userUid');
//   }

//   static init() {}
// }

import 'package:shared_preferences/shared_preferences.dart';

class GlobalData {
  static String? currentUserUid;

  static Future<void> saveUserUid() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'userUid', currentUserUid ?? ''); // Use ?? '' to handle null case
    } catch (e) {
      print("Error saving UID to SharedPreferences: $e");
    }
  }

  static Future<void> loadUserUid() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      currentUserUid = prefs.getString('userUid');
    } catch (e) {
      print("Error loading UID from SharedPreferences: $e");
    }
  }

  static Future<void> init() async {
    await loadUserUid(); // Load the UID from SharedPreferences during app initialization
  }
}
