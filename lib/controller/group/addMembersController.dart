import 'package:chat_application/model/groupmember.dart';
import 'package:chat_application/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/filterUsers.dart';
import '../../core/functions/getAllUsers.dart';
import '../../core/functions/getMuUser.dart';

class AddMembersController extends GetxController {
  final TextEditingController serchController = TextEditingController();
  List<GroupMember> membersList = [];
  User_? currentUser;

  List<User_> userList = [];
  List<User_> userSeach = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    currentUser = await getCurrentUser();
    statusRequest = StatusRequest.none;
    loadUsers();
    addMember(currentUser!,true,"jjjj");
  }

  StatusRequest? statusRequest;

  void searchData(String value) {

    userSeach = filterUsers(value, userList);
    update();
  }

  void loadUsers() async {
    userList = await getUsersFromFirestore();
    userSeach=userList;
    update();
  }

  void addMember(User_ user, bool isAdmin , String groupId )  {
    bool memberExists = false;

    for (final member in membersList) {
      if (member.uid == user.uid) {
        memberExists = true;
        break;
      }
    }
    if(!memberExists)
    {membersList.add(new GroupMember(name:user.name,
        uid:user.uid, email:user.email, isAdmin:isAdmin, groupId:groupId))  ;
    update();}
  }}

