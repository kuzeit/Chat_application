import 'package:chat_application/controller/auth/signup_controller.dart';
 import 'package:chat_application/core/constant/color.dart';
 import 'package:chat_application/core/functions/validinput.dart';
import 'package:chat_application/view/widget/auth/custombuttonauth.dart';
import 'package:chat_application/view/widget/auth/customtextbodyauth.dart';
import 'package:chat_application/view/widget/auth/customtextformauth.dart';
import 'package:chat_application/view/widget/auth/customtexttitleauth.dart';
import 'package:chat_application/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
           child: GetBuilder<SignUpControllerImp>(
            builder: (controller) =>
                 HandlingDataRequest(statusRequest: controller.statusRequest,widget:
                 Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const SizedBox(height: 20),
                            CustomTextTitleAuth(text: "10".tr),
                            const SizedBox(height: 10),
                            CustomTextBodyAuth(text: "24".tr),
                            const SizedBox(height: 15),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 20, "username");
                              },
                              mycontroller: controller.username,
                              hinttext: "23".tr,
                              iconData: Icons.person_outline,
                              labeltext: "20".tr,
                              // mycontroller: ,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 3, 40, "email");
                              },
                              mycontroller: controller.email,
                              hinttext: "12".tr,
                              iconData: Icons.email_outlined,
                              labeltext: "18".tr,
                              // mycontroller: ,
                            ),

                            CustomTextFormAuth(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 3, 30, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "13".tr,
                              iconData: Icons.lock_outline,
                              labeltext: "19".tr,
                              // mycontroller: ,
                            ),
                            CustomButtomAuth(
                                text: "17".tr,
                                onPressed: () {
                                  controller.signUp();
                                }),
                            const SizedBox(height: 40),
                            CustomTextSignUpOrSignIn(
                              textone: "25".tr,
                              texttwo: "26".tr,
                              onTap: () {
                                controller.goToSignIn();
                              },
                            ),
                          ]),
                        ),
                      )),
          )),
    );
  }
}