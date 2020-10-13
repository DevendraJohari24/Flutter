import 'package:you_chat/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot> (
      stream: FirebaseFirestore.instance.collection('chat_messages').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
          return LinearProgressIndicator();
        return ChatList(snapshots: snapshot.data.docs,);
      },
    );
  }
}
