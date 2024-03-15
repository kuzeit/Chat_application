import 'dart:io';

import 'package:chat_application/controller/chatController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../model/user.dart';

class ChatRoomController extends ChatController {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String ?chatRoomId ;
  User_ ?receivedUser;


  @override
  void onInit() {
    chatRoomId=Get.arguments['chatRoomId'];
    receivedUser=Get.arguments['user'] as User_;
    print(chatRoomId);
  }

  Future<void> onSendMessage(String chatRoomId) async {
    if (messageController.text.isNotEmpty) {
      final Map<String, dynamic> messages = {
        "sendby": _auth.currentUser!.displayName,
        "message": messageController.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      messageController.clear();
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }
}
