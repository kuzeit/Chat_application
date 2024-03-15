import 'package:flutter/material.dart';

class MemberListTile extends StatelessWidget {
  final List membersList;
  final int index;

  MemberListTile({
    required this.membersList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => showDialogBox(index),
      leading: Icon(Icons.account_circle),
      title: Text(
        membersList[index]['name'],
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(membersList[index]['email']),
      trailing: Text(
        membersList[index]['isAdmin'] ? "Admin" : "",
      ),
    );
  }

  void showDialogBox(int index) {
    // Implement the showDialogBox method logic here
  }
}