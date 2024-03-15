import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  late String groupId;
  late String groupName;


  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  List<dynamic> membersList = <dynamic>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    groupId=Get.arguments['groupId'];
    groupName=Get.arguments['groupName'];

    getGroupDetails();
  }

  Future<void> getGroupDetails() async {
    final chatMap = await _firestore.collection('groups').doc(groupId).get();
    membersList = chatMap['members'];
    isLoading.value = false;
  }

  bool checkAdmin() {
    final currentUserUid = _auth.currentUser!.uid;
    return membersList.any((element) =>
    element['uid'] == currentUserUid && element['isAdmin'] == true);
  }

  Future<void> removeMember(int index) async {
    final uid = membersList[index]['uid'];
    membersList.removeAt(index);
    isLoading.value = true;

    await _firestore.collection('groups').doc(groupId).update({
      'members': membersList.toList(),
    });

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('groups')
        .doc(groupId)
        .delete();

    isLoading.value = false;
  }

  Future<void> leaveGroup() async {
    if (!checkAdmin()) {
      isLoading.value = true;

      membersList.removeWhere((element) =>
      element['uid'] == _auth.currentUser!.uid && element['isAdmin'] == false);

      await _firestore.collection('groups').doc(groupId).update({
        'members': membersList.toList(),
      });

      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('groups')
          .doc(groupId)
          .delete();

    }
  }
}
