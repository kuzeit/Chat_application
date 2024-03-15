
import 'package:chat_application/view/screen/group/addGroups.dart';
import 'package:chat_application/view/screen/auth/login.dart';
import 'package:chat_application/view/screen/auth/signup.dart';
 import 'package:chat_application/view/screen/chatRoom.dart';
 import 'package:chat_application/view/screen/group/chatGroups.dart';
import 'package:chat_application/view/screen/group/create_group.dart';
import 'package:chat_application/view/screen/group/groups.dart';
import 'package:chat_application/view/screen/group/groupsInfo.dart';
 import 'package:chat_application/view/screen/homescreen.dart';
import 'package:chat_application/view/screen/language.dart';
import 'package:chat_application/view/screen/searchUsers.dart';
import 'package:get/get.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
   GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.search, page: () => const SearchUsers()),
  GetPage(name: AppRoute.chatRoom, page: () =>   ChatRoom()),
  GetPage(name: AppRoute.groups, page: () =>   Groups()),
  GetPage(name: AppRoute.groupInfo, page: () =>   GroupInfo()),
  GetPage(name: AppRoute.addMembers, page: () =>   AddMembers()),
  GetPage(name: AppRoute.createGroups, page: () =>   CreateGroup()),

  GetPage(name: AppRoute.chatGroup, page: () =>   GroupChat()),

];

