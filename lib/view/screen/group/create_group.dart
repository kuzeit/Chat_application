 import 'package:chat_application/core/class/statusrequest.dart';
import 'package:chat_application/model/groupmember.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../controller/group/createGroupController.dart';

class CreateGroup  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
Get.put(CreatGroupController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Name"),
      ),
      body: GetBuilder<CreatGroupController>(
    builder: (controller) =>
    controller.statusRequest==StatusRequest.loading
          ? Container(
              height: size.height,
              width: size.width,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 10,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: controller.groupName,
                      decoration: InputDecoration(
                        hintText: "Enter Group Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(
                  onPressed: controller.createGroup,
                  child: Text("Create Group"),
                ),
              ],
            ),
    ));
  }
}


//
