import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user.dart';

Future<List<User_>> getUsersFromFirestore() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<User_> userList=[];
  try {
    QuerySnapshot usersSnapshot = await _firestore.collection('users').get();

    for (var doc in usersSnapshot.docs) {
      String name = doc['name'];
      String uid = doc['uid'];
      String email = doc['email'];

      User_ user = User_(name:name,uid:uid ,email:email);
      userList.add(user);
    }
  } catch (error) {
    print('Error retrieving users from Firestore: $error');
  }

  return userList;
}