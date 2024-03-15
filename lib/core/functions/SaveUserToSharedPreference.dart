import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/services.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
MyServices myServices = Get.find();

Future<void> saveUserDataToSharedPreferences() async {
  try {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userSnapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .get();

      String name = userSnapshot['name'];
      String email = userSnapshot['email'];
      String uid = userSnapshot['uid'];

      SharedPreferences prefs = await myServices.sharedPreferences;
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('uid', uid);

    }
  } catch (error) {
    print('Error saving user data to SharedPreferences: $error');
  }
}