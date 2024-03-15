


import 'package:chat_application/controller/group/chatGroupController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/chatRoom/chatInputField.dart';
import '../../widget/chatRoom/messageTitle.dart';

class GroupChat extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ChatGroupController controller=Get.put(ChatGroupController());
    return Scaffold(
      //body: Text("vnvcbnvbn"),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: controller.goToGroupInfo(),
                icon: Icon(Icons.more_vert)),
          ],
        title:  Text("${controller.groupName}")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.27,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('groups')
                    .doc(controller.groupId)
                    .collection('chats')
                    .orderBy('time')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> chatMap =
                        snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                        return
                        MessageTile(
                          size: MediaQuery.of(context).size,
                          chatMap: chatMap, // Replace `chatMap` with the actual data
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            ChatInputField(
              chatRoomId: controller.groupId!,
              controller: controller,
              size: size,
              onPress: () {
                controller.onSendMessage(controller.groupId!) ;             },
            ),


          ],
        ),
      ),
    );
  }





}




