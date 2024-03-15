import 'package:chat_application/model/user.dart';

class GroupMember {

  final String name;
  final String uid;
  final String email ;

   final bool isAdmin ;
  final String groupId;

  GroupMember({required this.name, required this.uid, required this.email, required this.isAdmin, required this.groupId});

 }