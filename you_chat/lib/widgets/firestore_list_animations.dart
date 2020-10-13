import 'package:flutter/cupertino.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_chat/widgets/chat_message.dart';
import 'package:firebase_core/firebase_core.dart';


class FirestoreListAnimation extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(child: FirestoreAnimatedList(
        query: FirebaseFirestore.instance.collection('chat_messages').orderBy('timestamp', descending: true),
      reverse: true,
      itemBuilder: (
         BuildContext context,
         DocumentSnapshot snapshot,
         Animation<double> animation, int index,
      ){
          return SizeTransition(sizeFactor: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ), child: ChatMessage(snapshot: snapshot,),);
      },

    ));
  }
}