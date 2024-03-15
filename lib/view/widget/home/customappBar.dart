import 'package:chat_application/controller/home_controller.dart';
import 'package:chat_application/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomAppBar1 extends GetView<HomeControllerImp> //implements PreferredSizeWidget
{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Engrada'),
      backgroundColor: AppColor.primaryColor,
      elevation: 4.0,
      leading: GetBuilder<HomeControllerImp>(
    builder: (controller) =>IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          controller.goToSearchPage();
controller.update();          // Add your menu button functionality here
        },
      )),

     );
  }
 }