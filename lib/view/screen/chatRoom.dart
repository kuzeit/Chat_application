

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../controller/chatRoomController.dart';
import '../../model/user.dart';
import '../widget/chatRoom/chatInputField.dart';
import '../widget/chatRoom/chatMessages.dart';

 class ChatRoom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ChatRoomController controller =Get.put(ChatRoomController());
    return Scaffold(
      //body: Text("vnvcbnvbn"),
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(controller.receivedUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Container(
                child: Column(
                  children: [
                    Text(controller.receivedUser!.name),
                    Text(
                      snapshot.data!['status'],
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChatMessages(size: size, chatRoomId: controller.chatRoomId!),
            ChatInputField(
              chatRoomId: controller.groupId!,
              controller: controller,
              size: size,
              onPress: () {
                controller.onSendMessage(controller.chatRoomId!) ;             },
            ),
           ],
        ),
      ),
    );
  }
}


