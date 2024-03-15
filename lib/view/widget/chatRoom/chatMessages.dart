import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final Size size;
  final String chatRoomId;

  const ChatMessages({required this.size, required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 1.25,
      width: size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chatroom')
            .doc(chatRoomId)
            .collection('chats')
            .orderBy("time", descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder:(BuildContext context, int index) {
                final DocumentSnapshot ds = snapshot.data!.docs[index];
                final Map<String, dynamic> data = ds.data() as Map<String, dynamic>;

                if (data['type'] == "text") {
                  return Text(data['message']);
                } else if (data['type'] == "img") {
                  return Image.network(data['message']);
                } else {
                  return Container();
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
