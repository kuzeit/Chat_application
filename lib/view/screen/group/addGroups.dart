 import 'package:chat_application/core/class/statusrequest.dart';
import 'package:chat_application/core/constant/routes.dart';
import 'package:chat_application/core/functions/getMuUser.dart';
import 'package:chat_application/model/groupmember.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/group/addMembersController.dart';
import '../../../core/functions/filterUsers.dart';
import '../../../core/functions/getAllUsers.dart';
import '../../../model/user.dart';
class AddMembers extends StatelessWidget{
  AddMembers({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
  AddMembersController controller_=Get.put(AddMembersController());
         return Scaffold(

      body: GetBuilder<AddMembersController>(
        builder: (_) => Container(
          child:
          Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    print(value);
                    controller_.searchData(value)     ;        },

                  controller: controller_.serchController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller_.userSeach.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    User_ user = controller_.userSeach[index];

                    return InkWell(
                      onTap: (){

                        controller_.addMember(user,false,"jjjj");
                        print(controller_.membersList.length);},
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
           floatingActionButton:
           GetBuilder<AddMembersController>(
               builder: (_) =>
               controller_.membersList.length >= 2
                   ?FloatingActionButton(
                   child: Icon(Icons.forward),
                   onPressed: () {Get.toNamed(AppRoute.createGroups,
                       arguments: {
                         'membersList':controller_.membersList

                       });}
                )
               : SizedBox(),


  ));
   }}
