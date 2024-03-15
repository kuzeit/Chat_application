import 'dart:io';

import 'package:chat_application/controller/chatController.dart';
import 'package:chat_application/core/constant/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../model/user.dart';

class ChatGroupController extends ChatController {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String ?groupId ;
  String ?groupName;

  @override
  void onInit() {
    super.onInit();
    groupId=Get.arguments['groupId'];
    groupName=Get.arguments['groupName'];

   }
   void Function()? goToGroupInfo(){
    Get.toNamed(AppRoute.groupInfo,arguments: {
  "groupId":groupId,
  "groupName":groupName
});}
  Future<void> onSendMessage(String chatRoomId) async {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatData = {
        "sendBy": _auth.currentUser!.displayName,
        "message": messageController.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      messageController.clear();

      await _firestore
          .collection('groups')
          .doc(groupId)
          .collection('chats')
          .add(chatData);
    }
}}
