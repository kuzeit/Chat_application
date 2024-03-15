import 'package:chat_application/controller/group/groupsController.dart';
import 'package:chat_application/core/constant/routes.dart';

import '../../../model/group.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

 import '../../widget/home/customappBar.dart';
 import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Groups extends StatelessWidget {
  Groups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GroupsControllerImp());

    return Scaffold(

      body: GetBuilder<GroupsControllerImp>(
        builder: (controller) => Container(
          child:
          Column(

            children: [
              CustomAppBar1(),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.groupsList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Group group = controller.groupsList[index];

                    return InkWell(
                      onTap: (){controller.goToGroupChatPage(group);},
                      child: ListTile(
                        title: Text(group.name),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: ()  {Get.toNamed(AppRoute.addMembers);}
        ),
       );
  }}
