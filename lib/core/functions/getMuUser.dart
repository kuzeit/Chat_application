import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user.dart';


  Future<User_?> getCurrentUser() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      final uid = _auth.currentUser!.uid;
      final DocumentSnapshot snapshot = await _firestore.collection('users').doc(uid).get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        final name = data['name'] ?? '';
        final email = data['email'] ?? '';
        return User_(name: name, email: email, uid: uid);
      }
    } catch (e) {
      print('Error getting current user: $e');
    }

    return null;
  }
