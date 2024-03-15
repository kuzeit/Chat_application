import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../model/user.dart';

class ListItemsSearch extends GetView<HomeControllerImp> {
    ListItemsSearch({Key? key})
      : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                print(value);
                controller.searchData(value)     ;        },

              controller: controller.serchController,
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
              itemCount: controller.userSeach.length,
              itemBuilder: (context, index) {
                User_ user = controller.userSeach[index];

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
    );
  }
}
