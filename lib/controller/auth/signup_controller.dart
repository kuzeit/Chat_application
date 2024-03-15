import 'package:chat_application/core/class/statusrequest.dart';
import 'package:chat_application/core/constant/routes.dart';
 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/Methods_auth.dart';
import '../../core/functions/SaveUserToSharedPreference.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
   late TextEditingController password;

   StatusRequest statusRequest = StatusRequest.none;



  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading; 
      update() ;
      createAccount(username.text, email.text, password.text).then((user) {
        if (user != null) {
          statusRequest = StatusRequest.success;

           print("Account Created Successfully");
          update();
          Get.offNamed(AppRoute.homepage);

        } else {
          print("signup Failed");
          statusRequest = StatusRequest.failure;
          update();
        }});

      if (StatusRequest.success == statusRequest) {
         {saveUserDataToSharedPreferences();

        }

      }
      update();
    } else {
      
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
     email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
     password.dispose();
    super.dispose();
  }
}
