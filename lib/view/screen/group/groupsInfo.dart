import 'package:chat_application/view/widget/group/groupInfo/customGroupInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/group/groupController.dart';
import '../../widget/group/groupInfo/customTitleListInfo.dart';
import '../../widget/group/groupInfo/memberListTitle.dart';


class GroupInfo extends StatelessWidget {

  const GroupInfo({ Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
 Get.put(GroupController());
    return SafeArea(
      child: Scaffold(
        body:GetBuilder<GroupController>(
          builder: (controller) =>Container (
                child:controller.isLoading.value
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(),
                  ),
                  CustomGroupInfo(groupName:controller.groupName),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      '${controller.membersList.length} Members',
                      style: TextStyle(
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height / 20,
                  ),
                  controller.checkAdmin()
                      ? CustomListTileInfo(
                    onTap: controller.leaveGroup,
                    icon: Icons.logout,
                    color: Colors.redAccent,
                    text: 'Leave Group',
                  ): SizedBox(),


                  Flexible(
                    child: ListView.builder(
                      itemCount: controller.membersList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                         return MemberListTile(
                          membersList:controller.membersList,
                          index: index,);
                      },
                    ),
                  ),
                  CustomListTileInfo(
                    onTap: controller.leaveGroup,
                    icon: Icons.logout,
                    color: Colors.redAccent,
                    text: 'Leave Group',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}