import 'package:chat_application/controller/group/chatGroupController.dart';
import 'package:chat_application/controller/chatRoomController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/chatController.dart';

class ChatInputField extends StatelessWidget {
  final String chatRoomId;
  final ChatController controller;
  final Size size;
  final void Function() onPress; // New onPress parameter

  ChatInputField({
    required this.chatRoomId,
    required this.controller,
    required this.size,
    required this.onPress, // Added onPress parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 10,
      width: size.width,
      alignment: Alignment.center,
      child: Container(
        height: size.height / 12,
        width: size.width / 1.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height / 17,
              width: size.width / 1.3,
              child: TextField(
                controller: controller.messageController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.photo),
                  ),
                  hintText: "Send Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: onPress, // Use the onPress function here
            ),
          ],
        ),
      ),
    );
  }
}