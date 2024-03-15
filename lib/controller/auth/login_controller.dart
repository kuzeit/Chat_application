import 'package:chat_application/core/class/statusrequest.dart';
import 'package:chat_application/core/constant/routes.dart';
 import 'package:chat_application/core/services/services.dart';
 //import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/Methods_auth.dart';
import '../../core/functions/SaveUserToSharedPreference.dart';


class LoginControllerImp extends GetxController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;


  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      logIn(email.text, password.text).then((user) {
        if (user != null) {
          print("Login Sucessfull");
          statusRequest = StatusRequest.success;
          update();
          Get.offNamed(AppRoute.homepage);

        } else {
          print("Login Failed");
          statusRequest = StatusRequest.failure;
          update();
        }});


         if (statusRequest==StatusRequest.success) {
           saveUserDataToSharedPreferences();
            Get.offNamed(AppRoute.homepage);

        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }

      update();
    }}


  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    //  FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
   }
}
