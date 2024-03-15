 import 'package:chat_application/core/localization/translation.dart';
import 'package:chat_application/core/services/services.dart';
import 'package:chat_application/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';

  Future main() async {
   WidgetsFlutterBinding.ensureInitialized();


   await Firebase.initializeApp(
       options: FirebaseOptions(

           apiKey: "AIzaSyCOyXv0-lveoWBMSKy3DQefGp4UkiWp7lY",
           ///authDomain: "chatapplication-14c2b.firebaseapp.com",
           projectId: "chatapplication-14c2b",
           //storageBucket: "chatapplication-14c2b.appspot.com",
           messagingSenderId: "609538193550",
           appId: "1:609538193550:web:0e62cb51a15734d25d71df"));
   await initialServices();

   ////measurementId: "G-CZ59F9ZCYJ"
   runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Chat Application',
      locale: controller.language,
      theme: controller.appTheme,
       // routes: routes,
      getPages: routes,
    );
  }
}
