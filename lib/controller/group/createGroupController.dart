import 'package:chat_application/controller/chatController.dart';
import 'package:chat_application/core/constant/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../core/class/statusrequest.dart';
import '../../model/groupmember.dart';

class CreatGroupController extends GetxController{
    TextEditingController groupName = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StatusRequest? statusRequest ;
  List<GroupMember> membersList=[];

  @override
  void onInit() {
    super.onInit();

    membersList=Get.arguments['membersList'];
    update();
  }

  void createGroup() async {
    print("000000000");
    statusRequest=StatusRequest.loading;
    String groupId = Uuid().v1();

    final List<Map<String, dynamic>> membersMap = membersList.map((member) {
      return {
        'name': member.name,
        'uid': member.uid,
        'email': member.email,
        'isAdmin': member.isAdmin,
      };
    }).toList();


    await _firestore.collection('groups').doc(groupId).set({
      'members': membersMap,
      'id': groupId,
    });

    for (int i = 0; i < membersList.length; i++) {
      String uid =membersList[i].uid;

      await _firestore
          .collection('users')
          .doc(uid)
          .collection('groups')
          .doc(groupId)
          .set({
        "name": groupName.text,
        "id": groupId,
      });
    }

    await _firestore.collection('groups').doc(groupId).collection('chats').add({
      "message": "${_auth.currentUser!.displayName} Created This Group.",
      "type": "notify",
    });;

    statusRequest =StatusRequest.none;
    update();
Get.toNamed(AppRoute.chatGroup,
    arguments:{"groupId":groupId,"groupName":groupName.text} );
  }











}
