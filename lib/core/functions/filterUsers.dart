import '../../model/user.dart';

List<User_> filterUsers(String  name,List<User_>  userList) {
  List<User_>  userSeach=[];
  userSeach= userList
      .where((user) => user.name.toLowerCase().contains(name.toLowerCase()))
      .toList();
   return userSeach;

}
