import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../model/user.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  File? imageFile;
  String ?groupId ;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth _auth1 = FirebaseAuth.instance;


  Future<void> onSendMessage(String chatRoomId) async {

  }

  @override
  void onInit() {

  }
}