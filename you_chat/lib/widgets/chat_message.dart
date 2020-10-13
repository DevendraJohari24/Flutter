import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_chat/models/record.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {


  final DocumentSnapshot snapshot;

  const ChatMessage({Key key, this.snapshot}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final record = Record.fromSnapshot(snapshot);

    printText(){
      return record.photoUrl != null ? Image.network(record.photoUrl) : Text(record.text);
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundImage: NetworkImage(record.avatarUrl),),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: printText(),
            ),
          ),
        ],
      ),
    );
  }
}
