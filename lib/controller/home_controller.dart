
 import 'package:chat_application/core/constant/routes.dart';
 import 'package:chat_application/core/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/filterUsers.dart';
import '../core/functions/getAllUsers.dart';
import '../model/user.dart';

  class HomeControllerImp extends GetxController {
  MyServices myServices = Get.find();
  List<User_> userList = [];
  List<User_> userSeach = [];

  late TextEditingController serchController;

  String chatRoomId1(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }


  void loadUsers() async {
    userList = await getUsersFromFirestore();
update() ; }


  @override
  void onInit() {
    serchController = TextEditingController();

    super.onInit();
     loadUsers();
   }


  @override
  void dispose() {
    serchController.dispose();
     super.dispose();
  }

  void searchData(String value) {
    userSeach=filterUsers(value,userList);
     update();
  }
  void goToUserChatPage(  User_? receeivedUser ,chatRoomId) {

    Get.toNamed(AppRoute.chatRoom
        ,arguments: {
 "user":receeivedUser,
      "chatRoomId":chatRoomId


    }
    );
  }

  void goToSearchPage() {
      Get.toNamed(AppRoute.search);
  }

 }

