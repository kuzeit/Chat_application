import '../../model/user.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../widget/home/customappBar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
    HomePage({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return Scaffold(

      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
         child:
    Column(

           children: [
             CustomAppBar1(),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.userList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    User_ user = controller.userList[index];

                    return InkWell(
                      onTap: (){controller.goToUserChatPage
                        (user,controller.chatRoomId1( _auth.currentUser!.displayName!, user.name));},
                      child: ListTile(
                        title: Text(user.name),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
