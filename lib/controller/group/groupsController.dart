
import 'package:chat_application/core/constant/routes.dart';
import 'package:chat_application/core/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/group.dart';
import '../../model/user.dart';

class GroupsControllerImp extends GetxController {
  MyServices myServices = Get.find();
  List <Group>groupsList = [];


  String chatRoomId1(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Group>> getGroupsFromFirestore() async {
    final uid = _auth.currentUser!.uid;

    try {
      final QuerySnapshot groupsSnapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('groups')
          .get();

        final List<Group> groupsList = groupsSnapshot.docs.map((doc) {
        final groupId = doc['id'];
        final groupName = doc['name'];

        return Group(id: groupId, name: groupName);
      }).toList();

      return groupsList;
    } catch (error) {
      print('Error retrieving groups from Firestore: $error');
      return [];
    }
  }  void loadGroups() async {
    groupsList = await getGroupsFromFirestore();
    update() ; }



  @override
  void onInit() {

    super.onInit();
    loadGroups();
  }


  @override
  void dispose() {
     super.dispose();
  }

   void goToGroupChatPage( Group group) {

     Get.toNamed(AppRoute.chatGroup,
         arguments:{"groupId":group.id,"groupName":group.name} );


  }

  void goToSearchPage() {
    Get.toNamed(AppRoute.search);
  }

}

